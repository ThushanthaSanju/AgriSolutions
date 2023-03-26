const path = require("path");
const express = require("express");
const Bookings = require("../models/Booking.model");
const User = require("../models/users.model.js");

const Router = express.Router();

//Insert

Router.post(
  "/insert",
  async (req, res) => {
    try {
      let booking = new Bookings({
        vehiclename: req.body.vehiclename,
        drivername: req.body.drivername,
        contactno: req.body.contactno,
        priceperh: req.body.priceperh,
        hours: req.body.hours,
        address: req.body.address,
        total: req.body.total,

      });
      await booking.save();
      res.send("booking details uploaded successfully.");
    } catch (error) {
      res.status(400).send("Error while uploading Bookings. Try again later.");
    }
  },
  (error, req, res, next) => {
    if (error) {
      res.status(500).send(error.message);
    }
  }
);

//////////////////////////////////////////
// get booking details

Router.get("/getAllBookings", async (req, res) => {
  try {
    const files = await Bookings.find({});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  } catch (error) {
    res
      .status(400)
      .send("Error while getting list of Bookings. Try again later.");
  }
});

Router.put("/:id", async (req, res) => {
  try {
    let booking = await Bookings.findById(req.params.id);
    const data = {
        vehiclename: req.body.vehiclename || booking.vehiclename,
        drivername: req.body.drivername || booking.drivername,
        contactno: req.body.contactno || booking.contactno,
        priceperh: req.body.priceperh || booking.priceperh,
        hours: req.body.hours || booking.hours,
        address: req.body.address || booking.address,
        total: req.body.total || booking.total,

    };
    booking = await Bookings.findByIdAndUpdate(req.params.id, data, {
      new: true,
    });
    res.json(booking);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

//Delete
Router.delete("/:id", async (req, res) => {
  try {
    // Find booking by id
    const booking = await Bookings.findById(req.params.id);
    if (!booking) throw Error("No file found");
    const removed = await booking.remove();
    if (!removed)
      throw Error("Something went wrong while trying to delete the file");
    res.json(booking);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

module.exports = Router;
