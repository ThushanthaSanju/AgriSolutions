const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let User = new Schema({
    name: {type: String},
    mobileno: {type: String},
    email: {type: String},
    password: { type: String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("user", User);