require_relative 'mkauth'
require_relative 'mycroftmodels' 
  
puts 'Iniciando processo de migração de dados'

Mk_sis_cliente.establish_connection(  
	:adapter => "mysql2",  
	:host => "172.31.255.2",  
	:database => "mkradius",  
	:password=> 'vertrigo', 
	:username => 'root'				       
) 
mk = Mk_sis_cliente.where(cli_ativado: 's', isento: 'nao')
puts "Clientes ativos #{mk.count}"

mk.each do |client|
	nome = client.nome || 'NOME' #
	cpf = client.cpf_cnpj || '222'#
	endereco = client.endereco || '18BB'#
	bairro = client.bairro || 'INDUSTRIAL'#
	cep = client.cep || '61927.270' #
	cidade = client.cidade || 'Maracanaú' #
	estado = client.estado || 'CE' # verificar
	fone = client.fone || "66666"#
	obs = "CÓDIGO: #{client.id}, OBS: #{client.obs || 'SEM OBSERVAÇÃO' } - CAD:#{client.cadastro};" #
	tipo_conexao = client.tipo 
	vencimento = client.venc # vai pra link
	rg = client.rg #
	celular = client.celular #
	bloqueado = client.bloqueado # S ou N
	plano = client.plano

	puts "Povoando cliente: #{client.nome.upcase } código: #{client.id}"
	client = Client.create!( name: nome.upcase, cpf: cpf, phone: fone, cell: celular, description: obs.upcase, rg: rg)
	address = Address.create!(address: endereco.upcase, zip_code: (cep || '6100000'), city: cidade, state: estado.upcase, 
				  neighborhood: bairro.upcase, client_id: client.id, complement: "mk_auth" )
end 
