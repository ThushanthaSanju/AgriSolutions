const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let delivery = new Schema({
    itemcode: {type: String},
    method: { type: String},
    orderNo: { type: String},
    address: { type: String},
    contactno: { type: String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("delivery", delivery);