// Simple ESP32 Laser Diode Control

#define LASER_PIN 25  // GPIO pin connected to laser diode

void setup() {
  pinMode(LASER_PIN, OUTPUT);
  digitalWrite(LASER_PIN, LOW);  // Start with laser OFF
  Serial.begin(115200);
  Serial.println("Laser Control Ready");
}

void loop() {
  // Turn laser ON
  Serial.println("Laser ON");
  digitalWrite(LASER_PIN, HIGH);
  delay(2000);  // On for 2 seconds

  // Turn laser OFF
  Serial.println("Laser OFF");
  digitalWrite(LASER_PIN, LOW);
  delay(2000);  // Off for 2 seconds
}