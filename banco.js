use (banco)

db.usuario.insert({
    "id_usuario": id_usuario_unico,
    "nome": nome_usuario,
    "numero_telefone": numero_telefone,
    "login": login_usuario,
})

db.gerente.insert({
    "id_gerente": id_gerente_unico,
    "login": login_gerente,
})

