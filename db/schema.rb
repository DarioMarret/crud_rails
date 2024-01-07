# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_06_215738) do
  create_table "anticipos", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "empresa", null: false
    t.integer "id_usuario", null: false
    t.decimal "monto", precision: 10, scale: 2, null: false
    t.string "mes", limit: 15, null: false
    t.string "dia", limit: 10, null: false
    t.string "estado", limit: 60, null: false
    t.text "fecha_registro", null: false
  end

  create_table "asistencias", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "id_usuario", null: false
    t.text "empresa", null: false
    t.text "mes", null: false
    t.text "dia", null: false
    t.text "fecha", null: false
    t.text "hora_ingreso", null: false
    t.text "hora_salida"
  end

  create_table "base_cliente", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "razon_social", limit: 2500, null: false
    t.string "nombre", limit: 2500, null: false
    t.text "email"
    t.string "direccion"
    t.string "telefono", limit: 13
    t.string "cedula", limit: 13, null: false
    t.index ["cedula"], name: "cedula", unique: true
  end

  create_table "caja", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "fecha_cuadre", null: false
    t.text "fecha"
    t.text "usuario", null: false
    t.decimal "conteo", precision: 10, scale: 2, null: false
    t.decimal "venta", precision: 10, scale: 2, null: false
    t.decimal "cuadre_total", precision: 10, scale: 2, null: false
    t.text "empresa", null: false
    t.string "estado", limit: 10, null: false
    t.text "cantidaVouchers"
    t.text "totalVouchers"
  end

  create_table "canal", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "canal", limit: 191, null: false
    t.index ["canal"], name: "canal_canal_key", unique: true
  end

  create_table "categoria", primary_key: "id_categoria", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "categoria", null: false
    t.text "descripcion", null: false
    t.text "empresa", null: false
  end

  create_table "config_numeros", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "numero", limit: 191, null: false
    t.text "token", null: false
    t.string "proveedor", limit: 191, null: false
    t.text "url_api", null: false
    t.text "url_webhook", null: false
    t.string "empresa", limit: 191, null: false
    t.string "estado", limit: 191, default: "online", null: false
    t.string "identificador", limit: 191
    t.string "identificadorBusiness", limit: 191
  end

  create_table "configuracion_agente_ia", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "empresa", limit: 191, null: false
    t.string "modelo", limit: 191, null: false
    t.string "token_openia", limit: 191, null: false
    t.text "prompt", null: false
    t.integer "id_config_numeros", null: false
    t.integer "max_tokens"
    t.float "temperatura", limit: 53
    t.float "top_p", limit: 53
    t.index ["id_config_numeros"], name: "configuracion_agente_ia_id_config_numeros_fkey"
  end

  create_table "contacto", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "nombre", limit: 191, default: ""
    t.string "telefono", limit: 191, default: ""
    t.string "email", limit: 191, default: ""
    t.string "direccion", limit: 191, default: ""
    t.string "ciudad", limit: 191, default: ""
    t.string "codigo_postal", limit: 191, default: ""
    t.string "empresa", limit: 191, null: false
  end

  create_table "conversacion", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "fecha", precision: 3, default: -> { "CURRENT_TIMESTAMP(3)" }, null: false
    t.integer "conversacion_id", null: false
    t.integer "contacto_id", null: false
    t.json "mensajes", null: false
    t.string "estado", limit: 191, default: "pendiente", null: false
    t.string "tipo", limit: 191, default: "ingoing", null: false
    t.string "canal", limit: 191, default: "WhatsappCloudApi", null: false
    t.datetime "createdAt", precision: 3, default: -> { "CURRENT_TIMESTAMP(3)" }, null: false
    t.datetime "updatedAt", precision: 3, null: false
    t.string "empresa", limit: 191, null: false
    t.string "identificador", limit: 191
    t.index ["contacto_id"], name: "conversacion_contacto_id_fkey"
  end

  create_table "email_send", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "email", null: false
    t.text "link", null: false
    t.string "claveAcceso", limit: 49, null: false
    t.string "empresa", null: false
    t.text "fechaCreacion", null: false
    t.index ["claveAcceso"], name: "claveAcceso", unique: true
  end

  create_table "empresa", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "ruc", limit: 13, null: false
    t.text "razon_social", null: false
    t.string "ambiente", limit: 1, null: false
    t.decimal "iva_actual", precision: 10, scale: 2, null: false
    t.decimal "tarifa", precision: 10, scale: 2, null: false
    t.string "tipo_comprobante", limit: 3, null: false
    t.string "establecimiento", limit: 3, null: false
    t.string "punto_emision", limit: 3, null: false
    t.string "numero_secuencial", limit: 9, null: false
    t.string "tipo_emision", limit: 3, default: "1", null: false
    t.text "clave_firma"
    t.string "firma"
    t.string "empresa", null: false
    t.string "whatsapp", limit: 12, null: false
    t.string "correo", null: false
    t.text "logo_empresa"
    t.text "fecha_emision"
    t.text "fecha_vencimiento"
    t.text "entidad_cert"
    t.text "direccion", null: false
    t.text "matriz", null: false
    t.string "contabilidad", limit: 2, default: "NO", null: false
    t.string "factura", limit: 2, default: "NO"
    t.integer "id_vendedor"
    t.index ["empresa"], name: "empresa", unique: true
  end

  create_table "empresas", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "empresa", limit: 191, null: false
    t.index ["empresa"], name: "empresas_empresa_key", unique: true
  end

  create_table "entidades", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "entidad", null: false
    t.text "descripcion", null: false
    t.index ["entidad"], name: "entidad", unique: true
  end

  create_table "estructura_json", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "clave_acceso", limit: 49, null: false
    t.text "estructura_json", null: false
    t.string "empresa", null: false
    t.string "estado", limit: 60, null: false
    t.string "cedula", limit: 13, null: false
    t.integer "count_envio"
    t.text "fechaCreacion"
    t.index ["clave_acceso"], name: "clave_acceso", unique: true
  end

  create_table "etiqueta_asignadas", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "etiqueta_id", null: false
    t.integer "conversacion_id", null: false
    t.string "empresa", limit: 191, null: false
    t.index ["conversacion_id"], name: "etiqueta_asignadas_conversacion_id_fkey"
    t.index ["etiqueta_id"], name: "etiqueta_asignadas_etiqueta_id_fkey"
  end

  create_table "etiquetas", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "etiqueta", limit: 191, null: false
    t.string "color", limit: 191, default: "#00B09D"
    t.string "empresa", limit: 191, null: false
  end

  create_table "historial_conversacion_ia", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "content", null: false
    t.string "role", limit: 191, null: false
    t.integer "id_conversacion", null: false
    t.string "empresa", limit: 191, null: false
  end

  create_table "id_conversacion", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "id_conversacion", null: false
    t.string "empresa", limit: 191, null: false
  end

  create_table "login", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "usuario", null: false
    t.text "password", null: false
    t.text "token", null: false
    t.string "estado", limit: 60, null: false
    t.text "rol", null: false
    t.string "fecha_creacion", limit: 100, null: false
    t.string "fecha_pago", limit: 100, null: false
    t.index ["usuario"], name: "username", unique: true
  end

  create_table "materias_prima", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "empresa", null: false
    t.text "materi_prima", null: false
    t.decimal "peso_inicial", precision: 10, scale: 2, null: false
    t.decimal "peso_actual", precision: 10, scale: 2, null: false
    t.decimal "peso_concurrente", precision: 10, scale: 2, null: false
    t.text "medida_entrada", null: false
    t.text "medida_salida", null: false
    t.decimal "cantidad_alerta", precision: 10, scale: 2, null: false
    t.text "fecha_registro", null: false
    t.text "fecha_utimo_ingreso"
    t.integer "id_usuario_ultimo_ingreso"
  end

  create_table "medidas", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "medidas", limit: 60, null: false
  end

  create_table "merma_materia", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "empresa", null: false
    t.integer "id_materia", null: false
    t.decimal "peso_merma", precision: 10, scale: 2, null: false
    t.text "descripcion", null: false
    t.integer "id_usuario", null: false
    t.text "fecha_registro", null: false
  end

  create_table "mesas", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "empresa", null: false
    t.integer "numero_mesa", null: false
    t.string "estado", limit: 10, default: "DISPONIBLE", null: false
    t.text "mesero"
    t.decimal "total", precision: 10, scale: 2
    t.string "ceder", limit: 2, default: "NO", null: false
    t.text "fecha_registros"
  end

  create_table "movimiento", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "detalle", null: false
    t.string "usuario", null: false
    t.decimal "ingreso", precision: 10, scale: 2, null: false
    t.decimal "salida", precision: 10, scale: 2, null: false
    t.string "empresa", null: false
    t.text "fecha", null: false
    t.string "estado", limit: 10, null: false
    t.text "fechaCreacion", null: false
  end

  create_table "orden", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "auxiliar", null: false
    t.text "producto", null: false
    t.decimal "precio_venta", precision: 10, scale: 2, null: false
    t.decimal "porcentaje_iva", precision: 10, scale: 2, null: false
    t.integer "porcentaje", null: false
    t.text "empresa", null: false
    t.integer "cantidad", null: false
    t.text "opt", null: false
    t.text "random", null: false
    t.integer "orden", null: false
    t.text "usuario", null: false
    t.text "fecha", null: false
    t.integer "mesa", null: false
  end

  create_table "pdf", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "base64", null: false
    t.string "claveAcceso", limit: 49, null: false
    t.text "link"
    t.index ["claveAcceso"], name: "claveAcceso", unique: true
  end

  create_table "perfil", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "perfil", null: false
  end

  create_table "producto", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "auxiliar", limit: 9, null: false
    t.text "producto", null: false
    t.integer "id_categoria"
    t.decimal "precio_venta", precision: 10, scale: 2, null: false
    t.decimal "porcentaje_iva", precision: 10, scale: 2, null: false
    t.integer "porcentaje", null: false
    t.string "empresa", null: false
    t.string "estado", limit: 60, null: false
    t.text "fechaCreacion", null: false
    t.text "fechaUpdate", null: false
  end

  create_table "producto_tests", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios_admin", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "email"
    t.text "nombreCompleto", null: false
    t.text "password", null: false
    t.string "whatsapp", limit: 15
    t.text "empresa_array"
  end

  create_table "usuarios_caja", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "nombreCompleto", null: false
    t.string "perfil", limit: 60, null: false
    t.text "password", null: false
    t.string "whatsapp", limit: 15
    t.string "empresa", null: false
    t.text "fechaCreacion", null: false
    t.text "fechaLogin"
    t.text "fechaDeslogin"
    t.decimal "sueldo", precision: 10, scale: 2, null: false
    t.boolean "asegurado", null: false
  end

  create_table "usuarios_dash", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "nombreCompleto", null: false
    t.text "email", null: false
    t.text "password", null: false
  end

  create_table "vendedores", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "nombreCompleto", null: false
    t.text "email", null: false
    t.text "password", null: false
    t.text "ciudad", null: false
    t.decimal "comision", precision: 10, scale: 2, null: false
    t.string "estado", limit: 30, default: "ACTIVO", null: false
    t.string "perfil", limit: 30, default: "Vendedor", null: false
    t.text "fecha_creacion", null: false
  end

  create_table "ventas", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "secuencia", null: false
    t.text "producto", null: false
    t.decimal "precio_venta", precision: 10, scale: 2, null: false
    t.integer "cantidad", null: false
    t.text "fecha_creacion", null: false
    t.string "empresa", null: false
    t.string "estado", limit: 60, null: false
    t.string "forma_pago", limit: 60, null: false
    t.string "caja_usuario"
    t.text "fecha"
  end

  add_foreign_key "configuracion_agente_ia", "config_numeros", column: "id_config_numeros", name: "configuracion_agente_ia_id_config_numeros_fkey", on_update: :cascade
  add_foreign_key "conversacion", "contacto", name: "conversacion_contacto_id_fkey", on_update: :cascade
  add_foreign_key "etiqueta_asignadas", "conversacion", name: "etiqueta_asignadas_conversacion_id_fkey", on_update: :cascade
  add_foreign_key "etiqueta_asignadas", "etiquetas", name: "etiqueta_asignadas_etiqueta_id_fkey", on_update: :cascade
end
