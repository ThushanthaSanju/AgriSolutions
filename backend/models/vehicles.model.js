const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let vehicles = new Schema({
    vehiclename: {type: String},
    drivername: {type: String},
    contactno: {type: String},
    priceperh: { type: String},
    category: {type:String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("vehicles", vehicles);