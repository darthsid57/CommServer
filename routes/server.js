var express = require("express");
var router = express.Router();

var bodyparser = require("body-parser");
var mssql = require("mssql");
var cors = require("cors");

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
    idleTimeoutMillis: 30000
  }
};

router.get("/district", async function(req, resp) {
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request()
          .query(`SELECT DistrictID as 'key', DistrictName as 'text', DistrictID AS 'value' FROM TM_District
        WHERE IsActive=1;`);
      })
      .then(result => {
        let rows = result.recordset;
        resp.status(200).json(rows);
      });
  } catch (e) {
    console.log(e);
  }
});

router.get("/idtype", async function(req, resp) {
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request()
          .query(`SELECT IDTypeID  as 'key', IDType as 'text', IDTypeID AS 'value' FROM T_IDType
        WHERE IsActive=1;`);
      })
      .then(result => {
        let rows = result.recordset;
        resp.status(200).json(rows);
      });
  } catch (e) {
    console.log(e);
  }
});

router.get("/region", async function(req, resp) {
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request()
          .query(`SELECT  RegionID as 'key', Region as 'text', RegionID AS 'value' FROM TM_Region
        WHERE IsActive=1;`);
      })
      .then(result => {
        let rows = result.recordset;
        resp.status(200).json(rows);
      });
  } catch (e) {
    console.log(e);
  }
});

router.get("/office", async function(req, resp) {
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request()
          .query(`SELECT  OfficeID as 'key', OfficeName as 'text', OfficeID AS 'value' FROM TM_Office
            WHERE IsActive=1;`);
      })
      .then(result => {
        let rows = result.recordset;
        resp.status(200).json(rows);
      });
  } catch (e) {
    console.log(e);
  }
});

router.get("/communicationtype", async function(req, resp) {
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request().query(`SELECT * FROM TM_CommunicationType;`);
      })
      .then(result => {
        let rows = result.recordset;
        resp.status(200).json(rows);
      });
  } catch (e) {
    console.log(e);
  }
});

router.get("/subcategory", async function(req, resp) {
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request().query(`SELECT * FROM TM_SubCategory;`);
      })
      .then(result => {
        let rows = result.recordset;
        resp.status(200).json(rows);
      });
  } catch (e) {
    console.log(e);
  }
});

router.get("/user", async function(req, resp) {
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request().query(`SELECT * FROM T_User;`);
      })
      .then(result => {
        let rows = result.recordset;
        resp.status(200).json(rows);
      });
  } catch (e) {
    console.log(e);
  }
});

/* GET users listing. */
router.get("/", function(req, res, next) {
  res.send("server active");
});

module.exports = router;
