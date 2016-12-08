# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161016202933) do

  create_table "categorias", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "clientes", ["email"], name: "index_clientes_on_email", unique: true, using: :btree
  add_index "clientes", ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true, using: :btree

  create_table "detallepresupuestos", force: :cascade do |t|
    t.integer  "cantidad",       limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "presupuesto_id", limit: 4
    t.integer  "producto_id",    limit: 4
  end

  add_index "detallepresupuestos", ["presupuesto_id"], name: "fk_rails_b858da357a", using: :btree
  add_index "detallepresupuestos", ["producto_id"], name: "fk_rails_c97df77139", using: :btree

  create_table "logins", force: :cascade do |t|
    t.string   "usuario",    limit: 255
    t.string   "contrasena", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "marcas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "presupuestos", force: :cascade do |t|
    t.string   "fecha",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string   "nombre",       limit: 255
    t.integer  "categoria_id", limit: 4
    t.string   "foto",         limit: 255
    t.integer  "cantidad",     limit: 4
    t.integer  "precio",       limit: 4
    t.string   "vendedor",     limit: 255
    t.text     "descripcion",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "productos", ["categoria_id"], name: "fk_rails_d08a14d98a", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "detallepresupuestos", "presupuestos"
  add_foreign_key "detallepresupuestos", "productos"
  add_foreign_key "productos", "categorias"
end
