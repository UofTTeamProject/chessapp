class AddDefaultValueToCapturedAttribute < ActiveRecord::Migration[5.2]
  def up
      change_column_default :pieces, :captured, false
  end

  def down
      change_column_default :pieces, :captured, nil
  end
end
