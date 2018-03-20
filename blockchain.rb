require 'json'
require 'digest'
require 'pry'

class Blockchain

  def initialize
    @chain = []
    @current_transactions = []

    new_block 100, 1
  end

  ## Creates a new Block and adds it to the chain
  def new_block proof, previous_hash = nil
    # get hash of last block if no hash was passed in (not first block in chain)
    if previous_hash == nil then
      previous_hash = self.hash previous_block
    end

    block = {
      'index' => @chain.count,
      'timestamp' => Time.new,
      'transactions' => @current_transactions,
      'proof' => proof,
      'previous_hash' => previous_hash
    }

    # reset current list of transactions
    @current_transactions = []
    @chain << block
  end

  ## Adds a new transaction to the list of transactions
  def new_transaction sender,recipient, amount
    new_block = {
      'sender' => sender,
      'recipient' => recipient,
      'amount' => amount
    }

    @current_transactions << new_block
  end

  ## Returns last block in chain
  def previous_block
    return @chain[-1]
  end

  ## hashes a Block
  def hash block
    block_string = JSON.dump block

    return Digest::SHA256.hexdigest(block_string)
  end

  def validate_chain
    last_block = @chain[0]
    current_index = 1

    while current_index < @chain.count
      block = @chain[current_index]

      # check that the hash of the block is correct
      previous_hash = hash last_block
      puts "last block: \n#{last_block}"
      puts "#{block['previous_hash']} == #{previous_hash}"
      puts "\n--------------------\n"
      if block['previous_hash'] != previous_hash then
        puts "Chain is NOT VALID"
        return false
      end

      # increment index in chain
      last_block = block
      current_index += 1
    end
    puts "Chain is VALID"
    return true
  end

  def change_in_middle
    changed = @chain[3]
    changed["transactions"][0]["sender"] = "Jim"
  end
end
