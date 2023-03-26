const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let orders = new Schema({
  orderNo: {type: String},
    itemcode: {type: String},
    title: { type: String},
    address: { type: String},
    contactno: { type: String},
    quantity: {type:String},
    price: {type:String},
    itemname: {type:String},
    username:{type:String},
    method: { type: String},
    dcharge: { type: String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("orders", orders);