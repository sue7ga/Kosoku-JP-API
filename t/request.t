use strict;
use Test::More;
use Kosoku::JP::API;

my $kosoku = Kosoku::JP::API->new();

my $data = $kosoku->request('渋谷','浜松','普通車');

use Data::Dumper;

my $routes =  $kosoku->get_routes($data);



print Dumper $routes

foreach my $key(%$routes){
 print $key,"\n";
}

done_testing;