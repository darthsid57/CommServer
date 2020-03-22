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
        return pool.request()
          .query(`SELECT  SubCategoryID as 'key', SubCategory as 'text', SubCategoryID AS 'value' FROM TM_SubCategory
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

//SPO update - assign to PO, comment,
router.post("/grievance", async function(req, resp) {
  console.log(req.body.requestType);
  console.log(req.body.requestDescription);
  console.log(req.body.userId);
  console.log(req.body.branchId);
  console.log(req.body.departmentId);
  // var now = new Date();
  // var nowDate = now.toLocaleDateString("en-GB");
  // var nowTime = now.toLocaleTimeString("en-GB");
  // var json_date_created = now.toLocaleString("en-US");
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request().query(
          `DECLARE 
@clientNumber bigint,
@clientName varchar(50),
@IdNumber varchar(50),
@phoneContact bigint,
@emailAddress varchar(50),
@idType int,
@region int,
@office int,
@CustomerDetailID bigint,
@CommunicationTypeID int,
@IncidentType varchar(50),
@IncidentTime time,
@IncidentArea varchar(50),
@SubCategoryID int,
@VehicleNumber varchar(6),
@DistrictID int,
@IncidentDate date,
@OtherDetails varchar(50);

SET @clientNumber='${req.body.clientNumber}';
SET @clientName='${req.body.clientName}';
set @IdNumber = '${req.body.IdNumber}';
SET @phoneContact='${req.body.phoneContact}';
SET @emailAddress='${req.body.emailAddress}';
SET @idType = '${req.body.IdType}';
SET @region = '${req.body.region}';
SET @office = '${req.body.office}';
SET @CommunicationTypeID = 3;
SET @IncidentType = 'test';
SET @IncidentTime = '00:00:00';
SET @IncidentArea = 'test';
set @SubCategoryID = 1;
set @VehicleNumber = 'AA123';
set @DistrictID = 1;
set @IncidentDate = '3/22/2020';
set @OtherDetails = 'Other Details Test';

INSERT INTO T_CustomerDetail(CustomerNumber,CustomerName,PhoneContact,EmailAddress, IDNumber, RegionID,OfficeID, IDTypeID) 
VALUES(@clientNumber, @clientName, @phoneContact, @emailAddress, @IDNumber, @region, @office, @idType);

SET @CustomerDetailID = SCOPE_IDENTITY();

SELECT @CustomerDetailID;

INSERT INTO 
T_Communication (CustomerDetailID, 
CommunicationTypeID, 
IncidentType, 
IncidentTime, 
IncidentArea, 
SubCategoryID,
VehicleNumber, 
DistrictID,
IncidentDate, 
OtherDetails) 
VALUES(@CustomerDetailID, 
@CommunicationTypeID,
@IncidentType, 
@IncidentTime, 
@IncidentArea,
@SubCategoryID, 
@VehicleNumber,
@DistrictID, 
@IncidentDate,
@OtherDetails);`
        );
      })
      .then(result => {
        let rows = result.recordset;
        resp.status(200).json(rows);
      })
      .catch(err => {
        resp.status(500).send({ message: `${err}` });
        console.log(err);
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
