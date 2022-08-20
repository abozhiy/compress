Sequel.migration do
  change do
    run 'CREATE EXTENSION "uuid-ossp"'

    create_table(:images) do
      column    :uid, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      String    :file_name, null: false
      String    :content_type, null: true
      Integer   :file_size, null: true
      Timestamp :created_at, default: Sequel.lit("now()"), null: false
      Timestamp :updated_at, default: Sequel.lit("now()"), null: false
      DateTime  :compressed_at, null: true

      index :uid, unique: true
    end
  end
end
