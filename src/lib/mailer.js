const nodemailer = require('nodemailer')

module.exports = nodemailer.createTransport({
    host: "smtp.mailtrap.io",
    port: 2525,
    auth: {
      user: "733c5df13e7ae8",
      pass: "86e01a425f5072"
    }
  });

