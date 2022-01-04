import express from "express"

const port = 3000
const app = express()

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

app.get("/", (req, res) => {
  res.send("Hello, World!\n")
})
