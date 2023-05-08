enum Flavor {
  prod('production'),
  stg('staging');

  final String name;

  const Flavor(this.name);
}
