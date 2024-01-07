# crear un modelo pode se le pueda pasar argumentos cuantos se quiera

# $1 = nombre del modelo
# $2 = nombre de la tabla

# ejemplo de uso: ./model.sh User users

# crear el modelo

rails generate model ProductoTest name:string description:text price:decimal
rails db migrate

# crear el controlador
rails generate controller Api::V1::ProductoTests