class RecordDrug < ApplicationRecord
  belongs_to :record
  belongs_to :drug
end
