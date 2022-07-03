const express = require('express');
const os = require('os')
const app = express();
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const swaggerDocument = YAML.load('./swagger.yaml');
const conversor = require('./convert')
const bodyParser = require('body-parser');
const config = require('./config/system-life');

app.use(config.middlewares.healthMid);
app.use('/', config.routers);
app.use(bodyParser.urlencoded({ extended: false }))
app.set('view engine', 'ejs');
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument)); 

app.get('/fahrenheit/:valor/celsius', (req, res) => {

    let valor = req.params.valor;
    let celsius = conversor.fahrenheitCelsius(valor);
    res.json({ "celsius": celsius, "maquina": os.hostname() });
});

app.get('/celsius/:valor/fahrenheit', (req, res) => {

    let valor = req.params.valor;
    let fahrenheit = conversor.celsiusFahrenheit(valor);
    res.json({ "fahrenheit": fahrenheit, "maquina": os.hostname() });
});

app.get('/', (req, res) => {

    res.render('index',{valorConvertido: ''});
});

app.post('/', (req, res) => {
    let resultado = '';

    if (req.body.valorRef) {
        if (req.body.selectTemp == 1) {
            resultado = conversor.celsiusFahrenheit(req.body.valorRef)
        } else {
            resultado = conversor.fahrenheitCelsius(req.body.valorRef)
        }
    }

    res.render('index', {valorConvertido: resultado});
 });

app.listen(8081, () => {
    console.log("Servidor rodando na porta 8081");
});
