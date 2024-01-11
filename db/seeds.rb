# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Holidays
Holiday.insert_all(
  [
    { name: "Epifanía del Señor", date: Date.new(2023, 1, 6) },
    { name: "Día del Trabajo", date: Date.new(2023, 5, 1) },
    { name: "Asunción de la Virgen", date: Date.new(2023, 8, 15) },
    { name: "Fiesta Nacional de España", date: Date.new(2023, 10, 12) },
    { name: "Todos los Santos", date: Date.new(2023, 11, 1) },
    { name: "Día de la Constitución", date: Date.new(2023, 12, 6) },
    { name: "La Inmaculada Concepción", date: Date.new(2023, 12, 8) },
    { name: "Navidad", date: Date.new(2023, 12, 25) },
    { name: "Año Nuevo", date: Date.new(2024, 1, 1) },
    { name: "Epifanía del Señor", date: Date.new(2024, 1, 6) },
    { name: "Día del Trabajo", date: Date.new(2024, 5, 1) },
    { name: "Asunción de la Virgen", date: Date.new(2024, 8, 15) },
    { name: "Fiesta Nacional de España", date: Date.new(2024, 10, 12) },
    { name: "Todos los Santos", date: Date.new(2024, 11, 1) },
    { name: "Día de la Constitución", date: Date.new(2024, 12, 6) },
    { name: "Navidad", date: Date.new(2024, 12, 25) }
  ]
)
