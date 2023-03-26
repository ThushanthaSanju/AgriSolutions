const path = require("path");
const express = require("express");
const Delivery = require("../models/delivery.model");
const User = require("../models/users.model.js");

const Router = express.Router();

//Insert

Router.post(
  "/insert",
  async (req, res) => {
    try {
      let order = new Delivery({
        itemcode: req.body.itemcode,
        method: req.body.method,
        orderNo: req.body.orderNo,
        address: req.body.address,
        contactno: req.body.contactno,
      });
      await order.save();
      res.send("Delivery details uploaded successfully.");
    } catch (error) {
      res.status(400).send("Error while uploading Delivery. Try again later.");
    }
  },
  (error, req, res, next) => {
    if (error) {
      res.status(500).send(error.message);
    }
  }
);

//////////////////////////////////////////
// get order details

Router.get("/getDelivery", async (req, res) => {
  try {
    const files = await Delivery.find({});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  } catch (error) {
    res
      .status(400)
      .send("Error while getting list of Delivery. Try again later.");
  }
});

Router.put("/:id", async (req, res) => {
  try {
    let order = await Delivery.findById(req.params.id);
    const data = {
      itemcode: req.body.itemcode || order.itemcode,
      method: req.body.method || order.method,
      orderNo: req.body.orderNo || order.orderNo,
      address: req.body.address || order.address,
      contactno: req.body.contactno|| order.contactno,
    };
    order = await Delivery.findByIdAndUpdate(req.params.id, data, {
      new: true,
    });
    res.json(order);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

//////////////////////////////////////

//Delete
Router.delete("/:id", async (req, res) => {
  try {
    // Find order by id
    const order = await Delivery.findById(req.params.id);
    if (!order) throw Error("No file found");
    const removed = await order.remove();
    if (!removed)
      throw Error("Something went wrong while trying to delete the file");
    res.json(order);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

module.exports = Router;
