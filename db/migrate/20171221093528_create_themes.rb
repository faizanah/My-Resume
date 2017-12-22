class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :name , null: false
      t.string :color
      t.string :value, null: false
      t.timestamps
    end
    themes = [
        {name: 'Red' , color: '#e53935' , value: 'style-red.css' },
        {name: 'Pink' , color: '#E91E63' , value: 'style-pink.css' },
        {name: 'Purple' , color: '#9C27B0' , value: 'style-purple.css' },
        {name: 'Deep Purple' , color: '#673AB7' , value: 'style-deep-purple.css' },
        {name: 'Indigo' , color: '#3F51B5' , value: 'style-indigo.css' },
        {name: 'Blue' , color: '#2196F3' , value: 'style-blue.css' },
        {name: 'Teal' , color: '#009688' , value: 'style-teal.css' },
        {name: 'Green' , color: '#4CAF50' , value: 'style-green.css' },
        {name: 'Light Green' , color: '#8BC34A' , value: 'style-light-green.css' },
        {name: 'Amber' , color: '#ffb300' , value: 'style-amber.css' },
        {name: 'Orange' , color: '#ff9800' , value: 'style-orange.css' },
        {name: 'Deep Orange' , color: '#FF5722' , value: 'style-deep-orange.css' },
        {name: 'Brown' , color: '#795548' , value: 'style-brown.css' },
        {name: 'Blue Grey' , color: '#455A64' , value: 'style-blue-grey.css' },
        {name: 'Grey' , color: '#424242' , value: 'style-grey.css' },
    ]
    Theme.create!(themes)
  end
end
