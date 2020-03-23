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

router.get("/grievances", async function(req, resp) {
  try {
    await new mssql.ConnectionPool(config)
      .connect()
      .then(pool => {
        return pool.request().query(`SELECT 
        comm.CommunicationID,
        cd.CustomerNumber, 
        cd.CustomerName, 
        cd.PhoneContact, 
        cd.EmailAddress,
        r.Region,
        o.OfficeName,
        idt.IDType,
        cd.IDNumber,
        comt.CommunicationType,
        comm.IncidentType,
        comm.IncidentTime,
        comm.IncidentArea,
        comm.IncidentDate,
        sc.SubCategory,
        comm.VehicleNumber,
        comm.OtherDetails,
        comm.declaration,
        comm.linkToFile
        FROM T_Communication comm 
        JOIN T_CustomerDetail cd ON cd.CustomerDetailID=comm.CustomerDetailID
        JOIN TM_Region r ON r.RegionID=cd.RegionID
        JOIN TM_Office o ON o.OfficeID=cd.OfficeID
        JOIN T_IDType idt ON idt.IDTypeID=cd.IDTypeID
        JOIN TM_CommunicationType comt ON comt.CommunicationTypeID=comm.CommunicationTypeID
        JOIN TM_SubCategory sc ON sc.SubCategoryID=comm.SubCategoryID;`);
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
  // var now = new Date();
  // var nowDate = now.toLocaleDateString("en-GB");
  // var nowTime = now.toLocaleTimeString("en-GB");
  // var json_date_created = now.toLocaleString("en-US");
  console.log(req.body.clientNumber);
  console.log(req.body.clientName);
  console.log(req.body.IdNumber);
  console.log(req.body.phoneContact);
  console.log(req.body.emailAddress);
  console.log(req.body.IdType);
  console.log(req.body.region);
  console.log(req.body.office);
  console.log(req.body.typeofIncident);
  console.log(req.body.timeofIncident);
  console.log(req.body.incidentArea);
  console.log(req.body.SubCategory);
  console.log(req.body.vehicleNumber);
  console.log(req.body.region);
  console.log(req.body.incidentDate);
  console.log(req.body.otherDetails);
  console.log(req.body.declaration);
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
@OtherDetails varchar(50),
@declaration int;

SET @clientNumber='${req.body.clientNumber}';
SET @clientName='${req.body.clientName}';
set @IdNumber = '${req.body.IdNumber}';
SET @phoneContact='${req.body.phoneContact}';
SET @emailAddress='${req.body.emailAddress}';
SET @idType = '${req.body.IdType}';
SET @region = '${req.body.region}';
SET @office = '${req.body.office}';
SET @CommunicationTypeID = 3;
SET @IncidentType = '${req.body.typeofIncident}';
SET @IncidentTime = '${req.body.timeofIncident}';
SET @IncidentArea = '${req.body.incidentArea}';
set @SubCategoryID = '${req.body.SubCategory}';
set @VehicleNumber = '${req.body.vehicleNumber}';
set @DistrictID = '${req.body.region}';
set @IncidentDate = '${req.body.incidentDate}';
set @OtherDetails = '${req.body.otherDetails}';
set @declaration = '${req.body.declaration}';

INSERT INTO T_CustomerDetail(CustomerNumber,CustomerName,PhoneContact,EmailAddress, IDNumber, RegionID,OfficeID, IDTypeID) 
VALUES(@clientNumber, @clientName, @phoneContact, @emailAddress, @IDNumber, @region, @office, @idType );

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
OtherDetails,
declaration) 
VALUES(@CustomerDetailID, 
@CommunicationTypeID,
@IncidentType, 
@IncidentTime, 
@IncidentArea,
@SubCategoryID, 
@VehicleNumber,
@DistrictID, 
@IncidentDate,
@OtherDetails,
@declaration);`
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

router.post("/enquiry", async function(req, resp) {
  // var now = new Date();
  // var nowDate = now.toLocaleDateString("en-GB");
  // var nowTime = now.toLocaleTimeString("en-GB");
  // var json_date_created = now.toLocaleString("en-US");
  console.log(req.body.clientNumber);
  console.log(req.body.clientName);
  console.log(req.body.IdNumber);
  console.log(req.body.phoneContact);
  console.log(req.body.emailAddress);
  console.log(req.body.IdType);
  console.log(req.body.region);
  console.log(req.body.office);
  console.log(req.body.dateOfEnquiry);
  console.log(req.body.otherDetailsEnquiry);
  console.log(req.body.declaration);
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
          @dateOfEnquiry date,
          @otherDetailsEnquiry varchar(50),
          @declaration int;
          
          set @clientNumber='${req.body.clientNumber}';
          set @clientName='${req.body.clientName}';
          set @IdNumber='${req.body.IdNumber}';
          set @phoneContact='${req.body.phoneContact}';
          set @emailAddress='${req.body.emailAddress}';
          set @idType='${req.body.IdType}';
          set @region='${req.body.region}';
          set @office='${req.body.office}';
          set @CommunicationTypeID='1';
          set @dateOfEnquiry='${req.body.dateOfEnquiry}';
          set @otherDetailsEnquiry='${req.body.otherDetailsEnquiry}';
          set @declaration='${req.body.declaration}';
          
          INSERT INTO 
          T_CustomerDetail(CustomerNumber,
            CustomerName,
            PhoneContact,
            EmailAddress, 
            IDNumber, 
            RegionID,
            OfficeID, 
            IDTypeID) 
          VALUES(
            @clientNumber, 
            @clientName, 
            @phoneContact, 
            @emailAddress, 
            @IDNumber, 
            @region, 
            @office, 
            @idType);
          
          SET @CustomerDetailID = SCOPE_IDENTITY();
          
          
          INSERT INTO 
          T_Query (CustomerDetailID,
            CommunicationTypeID,
            QueryDate,
            QueryDetails,
            declaration)
          VALUES(
            @CustomerDetailID,
            @CommunicationTypeID,
            @dateOfEnquiry,
            @otherDetailsEnquiry,
            @declaration);`
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
