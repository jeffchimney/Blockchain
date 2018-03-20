require_relative 'blockchain'
require 'pry'
blockchain = Blockchain.new

blockchain.new_transaction "Jeff", "Bryce", 12345
blockchain.new_transaction "Bryce", "Jeff", 9000
blockchain.new_block 10

blockchain.new_transaction "Nick", "Bryce", 624
blockchain.new_transaction "Bryce", "Toon", 132
blockchain.new_block 20

blockchain.new_transaction "Bimbo", "Bryce", 5
blockchain.new_transaction "Bongo", "Jeff", 66
blockchain.new_block 30

blockchain.new_transaction "Jeff", "Bryce", 3452
blockchain.new_transaction "Bryce", "Jeff", 825
blockchain.new_block 40

blockchain.new_transaction "Jeff", "Bryce", 725
blockchain.new_transaction "Bryce", "Jeff", 4
blockchain.new_block 50

blockchain.new_transaction "Jeff", "Bryce", 4321
blockchain.new_transaction "Bryce", "Jeff", 1234
blockchain.new_block 60

blockchain.new_transaction "Jeff", "Bryce", 876
blockchain.new_transaction "Bryce", "Jeff", 45
blockchain.new_block 70

blockchain.new_transaction "Jeff", "Bryce", 12345
blockchain.new_transaction "Bryce", "Jeff", 2
blockchain.new_block 80

blockchain.new_transaction "Jeff", "Bryce", 1
blockchain.new_transaction "Bryce", "Jeff", 7
blockchain.new_block 90

blockchain.new_transaction "Jeff", "Bryce", 24
blockchain.new_transaction "Bryce", "Jeff", 32
blockchain.new_block 100

blockchain.new_transaction "Jeff", "Bryce", 74
blockchain.new_transaction "Bryce", "Jeff", 43
blockchain.new_block 110

blockchain.change_in_middle
blockchain.validate_chain
