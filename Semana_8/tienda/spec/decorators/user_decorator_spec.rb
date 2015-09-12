require 'rails_helper'

describe UserDecorator do
  let(:user) { User.create(name: 'Some', last_name: 'Sample',
                           email: 'a@email.com', password: '1234' )
  }
  let(:user_decorator) { UserDecorator.new(user) }

  describe '#nombre_completo' do
    it 'retorna name y last_name concatenados' do
      expect(user_decorator.nombre_completo).to eq 'SomeSample'
    end
  end

  describe 'identification_types' do
    it 'Retorna un arreglo con los identification_types en formato legible' do
      ary = [
          ['Cedula ciudadania', 'cedula_ciudadania'],
          ['Tarjeta de identidad', 'tarjeta_de_identidad'],
          ['Cedula extranjeria', 'cedula_extranjeria'],
          ['Pasaporte', 'pasaporte']
      ]
      expect(user_decorator.identification_types).to eq ary
    end
  end

  describe 'genders' do
    it 'Retorna un arreglo con los genders en formato legible' do
      ary = [
          ['Masculino', 'masculino'],
          ['Femenino', 'femenino'],
          ['Indefinido', 'indefinido']
      ]
      expect(user_decorator.genders).to eq ary
    end
  end

end