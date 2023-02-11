const fs = require('fs');
const express = require('express');

//Constant
const PORT = 8080;
const HOST = "127.0.0.1";

//App
const app = express();
app.get("/", async  (req, res) => {
	
	try{
		data = await fs.readFileSync('./logs/log.txt', 'utf8');
		res.send(data);
		console.log(data);
	} catch(e) {
		fs.writeFileSync('./logs/log.txt', e);
		res.send('hello world');
	}
});

console.log("test index.js")
setInterval(() => {
	
	console.log(__dirname)
}, 3000);

app.listen(PORT, () => {
	console.log('Running on https://locddddalhost:`${port}`');
});
