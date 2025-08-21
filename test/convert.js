const convert = require('../convert')
var expect  = require("chai").expect;

describe('Conversor de Temperatura', () => {

    it('Deve converter corretamente Fahrenheit para Celsius', (done) => {

      const resultado = convert.fahrenheitCelsius(131);

      expect(resultado).to.equal(55);
      done();
  
    });

    it('Deve converter corretamente Celsius para Fahrenheit', (done) => {

      const resultado = convert.celsiusFahrenheit(55);

      expect(resultado).to.equal(131);
      done();
  
    });    
  
  });