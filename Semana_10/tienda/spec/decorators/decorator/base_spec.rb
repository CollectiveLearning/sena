require 'rails_helper'

describe Decorator::Base do

  let(:user) { User.create(name: 'Some', last_name: 'Sample',
                           email: 'a@email.com', password: '1234' )
  }

  describe '#new' do
    it 'asigna el usuario en @objeto' do
      user_decorator = UserDecorator.new(user)
      expect(user_decorator.object).to eq user
    end

    it 'crea un metodo con el nombre de la clase de @objeto' do
      user_decorator = UserDecorator.new(user)
      expect(user_decorator.methods).to include(:user)
    end

    it 'crea un metodo con el nombre de la clase de @objeto' do
      class FakeDecorator < Decorator::Base; end
      fake = FakeDecorator.new(user)
      expect(fake.methods).to include(:fake)
    end
  end

  describe '#object' do
    it 'retorna @object' do
      user_decorator = UserDecorator.new(user)
      expect(user_decorator.object).to eq user
    end
  end

  describe '#decorate_collection' do
    it 'recibe un arreglo de objetos y retorna cada uno decorado' do
      decorated = UserDecorator.decorate_collection([user, user])
      expect(decorated.count).to eq 2
      decorated.each { |d| expect(d).to  an_instance_of UserDecorator }
    end
  end

  describe '#decorate' do
    it 'retorna el objeto decorado. Es un alias de #new' do
      expect(UserDecorator.decorate(user)).to an_instance_of(UserDecorator)
    end
  end

  describe '#method_missing' do
    it 'llama el metodo del @object si no esta implementado en el decorador' do
      user_decorator = UserDecorator.new(user)
      expect_any_instance_of(User).to receive(:name)
      user_decorator.name
    end
    it 'lanza una excepcion si el metodo no esta implementado en @objecti ni en el decorador' do
      user_decorator = UserDecorator.new(user)
      expect{user_decorator.namwed}.to raise_exception(NoMethodError)
    end
  end
end