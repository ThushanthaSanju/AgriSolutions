const path = require("path");
const express = require("express");
const products = require("../models/products.model");
const User = require("../models/users.model.js");

const Router = express.Router();

//Insert

Router.post(
  "/insert",
  async (req, res) => {
    try {
      let product = new products({
        title: req.body.title,
        itemcode: req.body.itemcode,
        imageUrl: req.body.imageUrl,
        price: req.body.price,
        quantity: req.body.quantity,
        category: req.body.category,
      });
      await product.save();
      res.send("product details uploaded successfully.");
    } catch (error) {
      res.status(400).send("Error while uploading products. Try again later.");
    }
  },
  (error, req, res, next) => {
    if (error) {
      res.status(500).send(error.message);
    }
  }
);

//////////////////////////////////////////
// get product details

Router.get("/getAllProducts", async (req, res) => {
  try {
    const files = await products.find({});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  } catch (error) {
    res
      .status(400)
      .send("Error while getting list of products. Try again later.");
  }
});

// get product details by age and gender

// find({}, {age:1, _id:0}).sort({_id:1}).limit(1)

// Router.get("/getIssuesaby", async (req, res) => {
//   try {
//     const userData = await User.findOne({}).sort({ _id: -1 }).limit(1);
//     if (
//       userData.age >= 18 &&
//       userData.age < 24 &&
//       userData.gender == "Male" &&
//       userData.civilstatus == "Unmarried"
//     ) {
//       const files = await products.find({ age: { $gt: 17, $lt: 24 } });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 18 &&
//       userData.age < 24 &&
//       userData.gender == "Male" &&
//       userData.civilstatus == "Married"
//     ) {
//       const files = await products.find({ age: { $gt: 17, $lt: 24 } });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 18 &&
//       userData.age < 24 &&
//       userData.gender == "Female" &&
//       userData.civilstatus == "Unmarried"
//     ) {
//       const files = await products.find({ age: { $gt: 17, $lt: 24 } });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 18 &&
//       userData.age < 24 &&
//       userData.gender == "Female" &&
//       userData.civilstatus == "Married"
//     ) {
//       const files = await products.find({ age: { $gt: 17, $lt: 24 } });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 18 &&
//       userData.age < 24 &&
//       userData.gender == "Other"
//     ) {
//       const files = await products.find({ age: { $gt: 17, $lt: 24 } });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 24 &&
//       userData.age < 30 &&
//       userData.gender == "Male" &&
//       userData.civilstatus == "Unmarried"
//     ) {
//       const files = await products.find({
//         age: { $gt: 23, $lt: 30 },
//         gender: "Male",
//         civilstatus: "Unmarried",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 24 &&
//       userData.age < 30 &&
//       userData.gender == "Male" &&
//       userData.civilstatus == "Married"
//     ) {
//       const files = await products.find({
//         age: { $gt: 23, $lt: 30 },
//         gender: "Male",
//         civilstatus: "Married",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 24 &&
//       userData.age < 30 &&
//       userData.gender == "Female" &&
//       userData.civilstatus == "Unmarried"
//     ) {
//       const files = await products.find({
//         age: { $gt: 23, $lt: 30 },
//         gender: "Female",
//         civilstatus: "Unmarried",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 24 &&
//       userData.age < 30 &&
//       userData.gender == "Female" &&
//       userData.civilstatus == "Married"
//     ) {
//       const files = await products.find({
//         age: { $gt: 23, $lt: 30 },
//         gender: "Female",
//         civilstatus: "Married",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 24 &&
//       userData.age < 30 &&
//       userData.gender == "Other"
//     ) {
//       const files = await products.find({ age: { $gt: 23, $lt: 30 } });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 30 &&
//       userData.age < 40 &&
//       userData.gender == "Male" &&
//       userData.civilstatus == "Unmarried"
//     ) {
//       const files = await products.find({
//         age: { $gt: 29, $lt: 40 },
//         gender: "Male",
//         civilstatus: "Unmarried",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 30 &&
//       userData.age < 40 &&
//       userData.gender == "Male" &&
//       userData.civilstatus == "Married"
//     ) {
//       const files = await products.find({
//         age: { $gt: 29, $lt: 40 },
//         gender: "Male",
//         civilstatus: "Married",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 30 &&
//       userData.age < 40 &&
//       userData.gender == "Female" &&
//       userData.civilstatus == "Unmarried"
//     ) {
//       const files = await products.find({
//         age: { $gt: 29, $lt: 40 },
//         gender: "Female",
//         civilstatus: "Unmarried",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 30 &&
//       userData.age < 40 &&
//       userData.gender == "Female" &&
//       userData.civilstatus == "Married"
//     ) {
//       const files = await products.find({
//         age: { $gt: 29, $lt: 40 },
//         gender: "Female",
//         civilstatus: "Married",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 30 &&
//       userData.age < 40 &&
//       userData.gender == "Other"
//     ) {
//       const files = await products.find({ age: { $gt: 29, $lt: 40 } });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 40 &&
//       userData.age < 100 &&
//       userData.gender == "Male" &&
//       userData.civilstatus == "Unmarried"
//     ) {
//       const files = await products.find({
//         age: { $gt: 39, $lt: 100 },
//         gender: "Male",
//         civilstatus: "Unmarried",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 40 &&
//       userData.age < 100 &&
//       userData.gender == "Male" &&
//       userData.civilstatus == "Married"
//     ) {
//       const files = await products.find({
//         age: { $gt: 39, $lt: 100 },
//         gender: "Male",
//         civilstatus: "Married",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 40 &&
//       userData.age < 100 &&
//       userData.gender == "Female" &&
//       userData.civilstatus == "Unmarried"
//     ) {
//       const files = await products.find({
//         age: { $gt: 39, $lt: 100 },
//         gender: "Female",
//         civilstatus: "Unmarried",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 40 &&
//       userData.age < 100 &&
//       userData.gender == "Female" &&
//       userData.civilstatus == "Married"
//     ) {
//       const files = await products.find({
//         age: { $gt: 39, $lt: 100 },
//         gender: "Female",
//         civilstatus: "Married",
//       });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else if (
//       userData.age >= 40 &&
//       userData.age < 100 &&
//       userData.gender == "Other"
//     ) {
//       const files = await products.find({ age: { $gt: 39, $lt: 100 } });
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     } else {
//       const files = await products.find({});
//       const sortedByCreationDate = files.sort(
//         (a, b) => b.createdAt - a.createdAt
//       );
//       res.send(sortedByCreationDate);
//     }
//   } catch (error) {
//     res
//       .status(400)
//       .send("Error while getting list of products. Try again later.");
//   }
// });

////////////////////////////////////



//Update

Router.put("/:id", async (req, res) => {
  try {
    let product = await products.findById(req.params.id);
    const data = {
      title: req.body.title || product.title,
      itemcode: req.body.itemcode || product.itemcode,
      imageUrl: req.body.imageUrl || product.imageUrl,
      price: req.body.price || product.price,
      quantity: req.body.quantity || product.quantity,
      category: req.body.category || product.category,
    };
    product = await products.findByIdAndUpdate(req.params.id, data, {
      new: true,
    });
    res.json(product);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});


Router.get("/getFruits", async(req, res) =>{
  try{
    const fruits = await products.find({ category: "Fruits" });
        const sortedByCreationDate = fruits.sort(
          (a, b) => b.createdAt - a.createdAt
        );
        res.send(sortedByCreationDate);

  }catch(e){
    res.status(400).json({ msg: e.message, success: false });
  }
});

Router.get("/getVegi", async(req, res) =>{
  try{
    const fruits = await products.find({ category: "Vegitables" });
        const sortedByCreationDate = fruits.sort(
          (a, b) => b.createdAt - a.createdAt
        );
        res.send(sortedByCreationDate);

  }catch(e){
    res.status(400).json({ msg: e.message, success: false });
  }
});

//////////////////////////////////////

//Delete
Router.delete("/:id", async (req, res) => {
  try {
    // Find product by id
    const product = await products.findById(req.params.id);
    if (!product) throw Error("No file found");
    const removed = await product.remove();
    if (!removed)
      throw Error("Something went wrong while trying to delete the file");
    res.json(product);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

module.exports = Router;
