const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let products = new Schema({
    title: {type: String},
    itemcode: {type: String},
    imageUrl: { type: String},
    price: { type: String},
    quantity: { type: String},
    category: {type:String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("products", products);