const fs = require('fs');
  
    try {
        fs.writeFileSync(__dirname + "/logs/log.txt", Date.now()+"log" + "_" + __dirname);
        console.log("cront----test ---",__dirname)
    } catch (error) {
        console.log(error)
    }  