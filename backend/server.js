const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const cors = require("cors");
const productsRoute = require("./controllers/products.controller");
const vehiclesRoute = require("./controllers/vehicles.controller");
const ordersRoute = require("./controllers/Orders.controller");
const bookingRoute = require("./controllers/Bookings.controller");
const AdminRoute = require("./controllers/admin.controllers");
const UserRoute = require("./controllers/user.controller");
const DeliveryRoute = require("./controllers/delivery.controller");

mongoose.set("strictQuery", false);

dotenv.config();
const app = express();
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// mongoose.connect("mongodb://localhost:27017/CtseDatabase", {useNewUrlParser:true},(error) =>{
//     if(error){
//         console.log('DataBase ERROR: ',error.message);
//     }
// });

const PORT = process.env.PORT || 8060;
const MONGODB_URI = process.env.MONGODB_URI;

mongoose.connect(
  MONGODB_URI,
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  },
  (error) => {
    if (error) {
      console.log("DataBase ERROR: ", error.message);
    }
  }
);

mongoose.connection.once("open", () => {
  console.log("Database Synced");
});

app.use("/products", productsRoute);

app.use("/vehicles", vehiclesRoute);

app.use("/orders", ordersRoute);

app.use("/bookings", bookingRoute);

app.use("/admin", AdminRoute);

app.use("/user", UserRoute);

app.use("/delivery", DeliveryRoute);

app.listen(PORT, () => {
  console.log(`Server is running on PORT ${PORT}`);
});
