const tracer = require('dd-trace').init();
const { createLogger, format, transports } = require('winston');

const logger = createLogger({
  level: 'info',
  exitOnError: false,
  format: format.json(),
  transports: [new transports.Console],
});

const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  logger.info('Hello World!');
  res.send('Hello World!');
});

app.get('/healthz', (req, res) => {
  res.send('All good!');
});

app.get('/error', (req, res) => {
  logger.error('Error (testing)!');
  res.status(500).send('Something broke (for testing)!');
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
