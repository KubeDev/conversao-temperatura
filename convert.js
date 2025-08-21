exports.celsiusFahrenheit = (valor) => {
    return ((valor * 9) / 5) + 32
};

exports.fahrenheitCelsius = (valor) => {
    return ((valor - 32) * 5) / 9;
};