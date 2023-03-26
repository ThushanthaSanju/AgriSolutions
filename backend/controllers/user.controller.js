const express = require('express')
const User = require('../models/users.model')
const router = express.Router()
const jwt = require("jsonwebtoken");
const config = require('../utils/config')

router.post('/signup',(req,res)=>{
    User.findOne({email:req.body.email},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user==null){
                const user = User({
                  name:req.body.name,
                  mobileno:req.body.mobileno,
                    email:req.body.email,
                    password:req.body.password
                })
                user.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(user)
                        res.json(user)
                    }
                    
                })
            }else{

            res.json({
                message:'email is not avilable'
            })   
            }
        }
    })
    
})
router.get('/user', async (req, res) => {
    try {
      const files = await User.find({});
      const sortedByCreationDate = files.sort(
        (a, b) => b.createdAt - a.createdAt
      );
      res.send(sortedByCreationDate);
    } catch (error) {
      res.status(400).send('Error while getting list of admins. Try again later.');
    }
  });

  router.delete("/:id", async (req, res) => {
    try {
      const user = await User.findById(req.params.id);
      if (!user) throw Error("No file found");
      const removed = await user.remove();
      if (!removed)
        throw Error("Something went wrong while trying to delete the file");
      res.json(user);
    } catch (e) {
      res.status(400).json({ msg: e.message, success: false });
    }
  });

router.post('/signin',(req,res)=>{
    User.findOne({email:req.body.email,password:req.body.password},(err,result)=>{
        if (err) return res.status(500).json({ msg: err });
        if (result === null) {
          return res.status(403).json("Email is incorrect");
        }
        if (result.password === req.body.password) {
          let token = jwt.sign({ email: req.body.email }, config.key, {});
    
          res.json({
            token: token,
            msg: "success",
          });
        } else {
          res.status(403).json("password is incorrect");
        }
    })
})
module.exports = router