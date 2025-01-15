String getWeatherIcon(int wmoCode) {
  if (wmoCode == 0) {
    return '☀️'; // Clear sky
  } else if (wmoCode == 1 || wmoCode == 2 || wmoCode == 3) {
    return '🌤'; // Partly cloudy
  } else if (wmoCode == 4) {
    return '☁️'; // Overcast
  } else if (wmoCode >= 5 && wmoCode <= 9) {
    return '🌫'; // Fog or mist
  } else if (wmoCode >= 10 && wmoCode <= 19) {
    return '🌦'; // Rain showers
  } else if (wmoCode >= 20 && wmoCode <= 29) {
    return '🌧'; // Rain
  } else if (wmoCode >= 30 && wmoCode <= 39) {
    return '🌨'; // Snow or snow showers
  } else if (wmoCode >= 40 && wmoCode <= 49) {
    return '🌩'; // Thunderstorms
  } else if (wmoCode >= 50 && wmoCode <= 59) {
    return '☔️'; // Drizzle
  } else if (wmoCode >= 60 && wmoCode <= 69) {
    return '❄️'; // Freezing rain or sleet
  } else if (wmoCode >= 70 && wmoCode <= 79) {
    return '☃️'; // Snowfall
  } else if (wmoCode >= 80 && wmoCode <= 89) {
    return '🌪'; // Severe weather (e.g., tornado, hurricane)
  } else if (wmoCode >= 90 && wmoCode <= 99) {
    return '🔥'; // Extreme conditions (e.g., volcanic ash, wildfires)
  } else {
    return '🤷‍'; // Unknown or unhandled condition
  }
}

String getMessage(int temp) {
  if (temp > 25) {
    return 'It\'s 🍦 time';
  } else if (temp > 20) {
    return 'Time for shorts and 👕';
  } else if (temp < 10) {
    return 'You\'ll need 🧣 and 🧤';
  } else {
    return 'Bring a 🧥 just in case';
  }
}
