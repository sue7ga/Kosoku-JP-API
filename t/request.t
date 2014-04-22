use strict;
use Test::More;
use Kosoku::JP::API;

my $kosoku = Kosoku::JP::API->new();

my $data = $kosoku->request('渋谷','浜松','普通車');

use Data::Dumper;

is($kosoku->get_frompoint($data),'渋谷','from');
is($kosoku->get_topoint($data),'浜松','from');
is($kosoku->get_cartype($data),'普通車','cartype');
is($kosoku->get_SortBy($data),'距離','sortby');

done_testing;