require './mycroftmodels'
require './mkauth' 
  
puts 'Iniciando processo de migração de dados'

mk = Mk_sis_cliente.where(cli_ativado: 's', isento: 'nao').where('login not %?', 'rafanet.com')
puts "Clientes ativos #{mk.count}"

mk.each do |client|
	nome = client.nome #
	cpf = client.cpf_cnpj #
	endereco = client.endereco  #
	bairro = client.bairro #
	cep = client.cep #
	cidade = client.cidade #
	estado = client.estado # verificar
	fone = client.fone #
	obs = "OBS: #{client.obs} - CAD:#{client.cadastro};" #
	tipo_conexao = client.tipo 
	vencimento = client.venc # vai pra link
	rg = client.rg #
	celular = client.celular #
	bloqueado = client.bloqueado # S ou N
	plano = client.plano

	puts "Povoando cliente: #{client.nome } código: #{client.id}"
	client = Client.create!( name: nome, cpf: cpf, phone: fone, cell: celular, description: obs, rg: rg)
	address = Address.create!(address: endereco, zip_code: (cep || '6100000'), city: cidade, state: estado, 
		neighborhood: bairro, client_id: client.id, complement: "mk_auth" )
end 
