const path = require("path");
const express = require("express");
const Orders = require("../models/orders.model");
const User = require("../models/users.model.js");

const Router = express.Router();

//Insert

Router.post(
  "/insert",
  async (req, res) => {
    try {
      let order = new Orders({
        orderNo: req.body.orderNo,
        itemcode: req.body.itemcode,
        title: req.body.title,
        address: req.body.address,
        contactno: req.body.contactno,
        quantity: req.body.quantity,
        price: req.body.price,
        itemname: req.body.itemname,
        username: req.body.username,
        method: req.body.method,
        dcharge: req.body.dcharge,

      });
      await order.save();
      res.send("order details uploaded successfully.");
    } catch (error) {
      res.status(400).send("Error while uploading Orders. Try again later.");
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

Router.get("/getAllOrders", async (req, res) => {
  try {
    const files = await Orders.find({});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  } catch (error) {
    res
      .status(400)
      .send("Error while getting list of Orders. Try again later.");
  }
});

Router.put("/:id", async (req, res) => {
  try {
    let order = await Orders.findById(req.params.id);
    const data = {
      orderNo: req.body.orderNo || order.orderNo,
      itemcode: req.body.itemcode || order.itemcode,
      title: req.body.title || order.title,
      address: req.body.address || order.address,
      contactno: req.body.contactno|| order.contactno,
      quantity: req.body.quantity || order.quantity,
      price: req.body.price || order.price,
      itemname: req.body.itemname || order.itemname,
      username: req.body.username || order.username,
      method: req.body.method || order.method,
      dcharge: req.body.dcharge || order.dcharge,

    };
    order = await Orders.findByIdAndUpdate(req.params.id, data, {
      new: true,
    });
    res.json(order);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

// Router.get("/getFruits", async (req, res) => {
//   try {
//     const fruits = await Orders.find({ category: "Fruits" });
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
    // Find order by id
    const order = await Orders.findById(req.params.id);
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
