const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let bookings = new Schema({
    vehiclename: {type: String},
    drivername: {type: String},
    contactno: {type: String},
    priceperh: { type: String},
    hours: {type:String},
    address: {type:String},
    total: {type:String},

  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("bookings", bookings);