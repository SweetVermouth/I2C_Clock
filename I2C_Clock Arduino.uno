#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);  // I2C 0x27, LCD 16x2

unsigned long previousMillis = 0;
const long interval = 1000;  // Interval 1 Second

int seconds = 15;   // Set Seconds
int minutes = 19;  // Set Minutes
int hours = 16;    // Set Hours

void setup() {
  lcd.init();         // initialisation LCD
  lcd.backlight();    // Turn On backlight
  lcd.setCursor(3,1);
  lcd.print("Heptalogue");
}

void loop() {
  unsigned long currentMillis = millis();

  // Update every 1 Second
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;

    seconds++;  // +1 Seconds

    // counting minute and hours
    if (seconds >= 60) {
      seconds = 0;
      minutes++;
      if (minutes >= 60) {
        minutes = 0;
        hours++;
        if (hours >= 24) {
          hours = 0;
        }
      }
    }

    // Showing clock in LCD
    lcd.setCursor(4, 0);
    printTwoDigits(hours);
    lcd.print(":");
    printTwoDigits(minutes);
    lcd.print(":");
    printTwoDigits(seconds);

    // Showing AM/PM
    lcd.setCursor(13, 0);
    if (hours < 12) {
      lcd.print("AM");
    } else {
      lcd.print("PM");
    }
  }
}

// This function is for showing 2 digit (example: 01, 02, 03, etc.)
void printTwoDigits(int number) {
  if (number < 10) {
    lcd.print("0");
  }
  lcd.print(number);
}
