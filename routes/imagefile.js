var express = require("express");
var router = express();
var fs = require("fs");

// console.log(__dirname);

// app.use("/cssFiles", express.static(__dirname + "/assets"));

/* GET users listing. */
router.get("/images/test.jpg", function(req, res, next) {
  // res.sendFile( __dirname + "/assets/test.jpg");
  // res.sendFile(
  //   "C:/Users/Siddhant/Desktop/Land Transport Authority Work/CommServer/assets/test.jpg"
  // );

  // res.sendFile(`C:/Users/Siddhant/Music/${req.params.id}.jpg`);

  var value = 10085;
  // const directoryPath =
  //   "C:/Users/Siddhant/Desktop/Land Transport Authority Work/CommServer/assets";

  // fs.readdir(directoryPath, function(err, files) {
  //   if (err) {
  //     return console.log("Unable to Scan Directory: " + err);
  //   }

  //   for (let i = 0; i < files.length; i++) {
  //     if (files[i] == value) {
  //       console.log(files[i]);
  //     }
  //   }

  //   // //listing all files using forEach
  //   // files.forEach(function(file) {
  //   //   console.log(file);
  //   // });
  // });

  res.sendFile(
    `C:/Users/Siddhant/Desktop/Land Transport Authority Work/CommServer/assets/${value}.png`
  );
  // res.sendFile(
  //   `C:/Users/Siddhant/Desktop/Land Transport Authority Work/CommServer/assets/${value}.jpg`
  // );
  // res.sendFile(
  //   `C:/Users/Siddhant/Desktop/Land Transport Authority Work/CommServer/assets/${value}.jpeg`
  // );
});

module.exports = router;
