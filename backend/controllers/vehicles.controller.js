const path = require("path");
const express = require("express");
const Vehicles = require("../models/Vehicles.model");
const User = require("../models/users.model.js");

const Router = express.Router();

//Insert

Router.post(
  "/insert",
  async (req, res) => {
    try {
      let vehicle = new Vehicles({
        vehiclename: req.body.vehiclename,
        drivername: req.body.drivername,
        contactno: req.body.contactno,
        priceperh: req.body.priceperh,
        category: req.body.category,
      });
      await vehicle.save();
      res.send("vehicle details uploaded successfully.");
    } catch (error) {
      res.status(400).send("Error while uploading Vehicles. Try again later.");
    }
  },
  (error, req, res, next) => {
    if (error) {
      res.status(500).send(error.message);
    }
  }
);

//////////////////////////////////////////
// get vehicle details

Router.get("/getAllVehicles", async (req, res) => {
  try {
    const files = await Vehicles.find({});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  } catch (error) {
    res
      .status(400)
      .send("Error while getting list of Vehicles. Try again later.");
  }
});

Router.put("/:id", async (req, res) => {
  try {
    let vehicle = await Vehicles.findById(req.params.id);
    const data = {
        vehiclename: req.body.vehiclename || vehicle.vehiclename,
        drivername: req.body.drivername || vehicle.drivername,
        contactno: req.body.contactno || vehicle.contactno,
        priceperh: req.body.priceperh || vehicle.priceperh,
      category: req.body.category || vehicle.category,
    };
    vehicle = await Vehicles.findByIdAndUpdate(req.params.id, data, {
      new: true,
    });
    res.json(vehicle);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

// Router.get("/getFruits", async (req, res) => {
//   try {
//     const fruits = await Vehicles.find({ category: "Vehicles" });
//     const sortedByCreationDate = fruits.sort(
//       (a, b) => b.createdAt - a.createdAt
//     );
//     res.send(sortedByCreationDate);
//   } catch (e) {
//     res.status(400).json({ msg: e.message, success: false });
//   }
// });


//////////////////////////////////////

//Delete
Router.delete("/:id", async (req, res) => {
  try {
    // Find vehicle by id
    const vehicle = await Vehicles.findById(req.params.id);
    if (!vehicle) throw Error("No file found");
    const removed = await vehicle.remove();
    if (!removed)
      throw Error("Something went wrong while trying to delete the file");
    res.json(vehicle);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

module.exports = Router;
