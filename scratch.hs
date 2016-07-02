
import qualified Data.Map as M

table = M.empty

table' = M.insert 4 [2] table

table'' = M.delete 4 table'

table''' = M.insertWith (++) 6 [2] table''

table'''' = M.insertWith (++) 6 [3] table'''

-- table''''' = M.delete 6 
