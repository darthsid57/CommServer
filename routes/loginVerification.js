var express = require("express");
var router = express.Router();
const path = require("path");
const multer = require("multer");

var bodyparser = require("body-parser");
var mssql = require("mssql");
var cors = require("cors");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const saltRounds = 10;

router.use(cors());

router.use(bodyparser.json());
router.use(bodyparser.urlencoded({ extended: false }));

var config2 = require("./config");

const config = {
  user: config2.user,
  password: config2.password,
  server: config2.server,
  database: config2.database,

  pool: {
    max: 100,
    min: 0,
    idleTimeoutMillis: 30000,
  },
};

router.get("/", function (req, res, next) {
  res.send("loginVerification");
});

router.get("/user/getTokenData", verifyToken, function (req, resp) {
  jwt.verify(req.token, "SuperSecRetKey", (err, authData) => {
    if (err) {
      resp.sendStatus(403);
    } else {
      mssql.connect(config, function (error) {
        if (error) {
          console.log(error);
          mssql.close();
        } else {
          console.log("Connection with Database Established : Get Token Data ");
          var request = new mssql.Request();
          resp.json({ authdata: authData.rows.recordset });
          //   resp.json({ recordset: recordset.recordset });
          mssql.close();
        }
      });
    }
  });
});

//User signin route - create a token and return to user
router.post("/api/signin", (req, resp) => {
  mssql.connect(config, function (error) {
    if (error) {
      console.log(error);
      mssql.close();
    } else {
      console.log("Connected!");
      var request = new mssql.Request();

      request.query(
        `SELECT
        tu.username
         ,tu.UserID
         ,tu.password
      FROM T_User tu
      WHERE tu.username = '${req.body.username}'`,
        function (error, rows) {
          const userPassword = rows.recordset.map((x) => x.password);

          //console.log(userPassword.toLocaleString());
          bcrypt.compare(
            req.body.password,
            userPassword.toLocaleString(),
            function (err, result) {
              if (result == true) {
                console.log("Passed");
                if (error) {
                  console.log(error);
                  mssql.close();
                } else {
                  jwt.sign(
                    { rows },
                    "SuperSecRetKey",
                    { expiresIn: 60 * 60 },
                    (err, token) => {
                      resp.json({ token });
                      mssql.close();
                    }
                  );
                }
              } else {
                resp.send({ data: "Incorrect Password", status: 500 });
                mssql.close();
              }
            }
          );
        }
      );
    }
  });
});

// Get Decoded Token
router.post("/api/token", verifyToken, function (req, resp) {
  jwt.verify(req.token, "SuperSecRetKey", (err, authData) => {
    if (err) {
      resp.sendStatus(403);
    } else {
      resp.json({ authData: authData.rows.recordset });
    }
  });
});

//ADMINISTRATION
//POST: Create User
// Insert User
router.post("/user", function (req, resp) {
  mssql.connect(config, function (error) {
    if (error) {
      console.log(error);
      mssql.close();
    } else {
      console.log("Connected!");
      var request = new mssql.Request();

      bcrypt.hash(req.body.password, saltRounds, function (err, hash) {
        console.log(req.body.username);
        console.log(hash);
        request.query(
          `INSERT INTO T_User (
                      username,
                      password,
                      IsActive)
                      VALUES (
                      '${req.body.username}',
                      '${hash}',
                      '1');`,
          function (error, rows, fields) {
            if (error) {
              console.log(error);
              mssql.close();
            } else {
              //resp.json(rows[1].branch);
              //resp.json(rows);
              resp.send("Inserted Successfully");

              mssql.close();
            }
          }
        );
      });
    }
  });
});

//Verify Token
function verifyToken(req, res, next) {
  // Get Auth header value
  const bearerHeader = req.headers["authorization"];
  // Check if bearer is undefined
  if (typeof bearerHeader !== "undefined") {
    // Split at the space
    const bearer = bearerHeader.split(" ");
    // Get token from array
    const bearerToken = bearer[1];
    // Set the Token
    req.token = bearerToken;
    // Next Middleware
    next();
  } else {
    //Forbidden
    res.sendStatus(403);
  }
}

module.exports = router;
