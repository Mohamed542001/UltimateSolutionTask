import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:ultimate_solution_task/features/dashboard/data/models/country_model.dart';
import 'package:ultimate_solution_task/features/dashboard/data/models/revenue_model.dart';
import 'package:ultimate_solution_task/features/dashboard/data/models/torust_model.dart';

import '../../../core/src/app_export.dart';
import '../data/models/user.dart';
import '../data/repository/dashboard_repository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _dashboardRepository;
  DashboardCubit(
    this._dashboardRepository,
  ) : super(FeatureIdle());

  static DashboardCubit get(context) => BlocProvider.of<DashboardCubit>(context);

  bool isHovered = false;

  onHover(AnimationController controller,bool hovering) {
    if (hovering) {
      controller.forward();
    } else {
      controller.reverse();
    }
      emit(CardHoverSuccess());
  }

  void initAnimation(TickerProvider ticker,AnimationController controller,Animation<double> rotationAnimation){
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: ticker,
    );
    rotationAnimation = Tween<double>(begin: 0.6, end: 0.0).animate(controller);
  }

  bool isSegmentationHover = false;
  onSegmentationHover() {
    isSegmentationHover=!isSegmentationHover;
    print(isSegmentationHover);
    emit(CardHoverSuccess());
  }


  List<RevenueModel> getRevenueModel() {
    return [
      RevenueModel('03 Jan', 42, 200),
      RevenueModel('05 Jan', 27, 180),
      RevenueModel('07 Jan', 22, 160),
      RevenueModel('09 Jan', 31, 140),
      RevenueModel('11 Jan', 12, 200),
      RevenueModel('14 Jan', 12, 250),
      RevenueModel('15 Jan', 12, 300),
      RevenueModel('16 Jan', 12, 50),
    ];
  }








  late MapShapeSource mapSource;
  late List<CountryDensity> worldPopulationDensity;
  late List<TouristPlaceDetails> touristPlaces;
  late List<ValueNotifier<bool>> isHoveredStates;
  final double markerSize = 24;

  void initMap(){
    touristPlaces = <TouristPlaceDetails>[
      const TouristPlaceDetails(
          MapLatLng(28.849437511655275, 29.56695890104464), 'Egypt'),
      const TouristPlaceDetails(
          MapLatLng(37.0902, -95.7129), 'United States of America'),
      const TouristPlaceDetails(MapLatLng(23.8859, 45.0792), 'Saudi Arabia'),
    ];
    isHoveredStates = List.generate(touristPlaces.length, (_) => ValueNotifier(false));

    worldPopulationDensity = <CountryDensity>[
      CountryDensity('Monaco', 26337),
      CountryDensity('Macao', 21717),
      CountryDensity('Singapore', 8358),
      CountryDensity('Hong kong', 7140),
      CountryDensity('Gibraltar', 3369),
      CountryDensity('Bahrain', 2239),
      CountryDensity('Holy See', 1820),
      CountryDensity('Maldives', 1802),
      CountryDensity('Malta', 1380),
      CountryDensity('Bangladesh', 1265),
      CountryDensity('Sint Maarten', 1261),
      CountryDensity('Bermuda', 1246),
      CountryDensity('Channel Islands', 915),
      CountryDensity('State of Palestine', 847),
      CountryDensity('Saint-Martin', 729),
      CountryDensity('Mayotte', 727),
      CountryDensity('Taiwan', 672),
      CountryDensity('Barbados', 668),
      CountryDensity('Lebanon', 667),
      CountryDensity('Mauritius', 626),
      CountryDensity('Aruba', 593),
      CountryDensity('San Marino', 565),
      CountryDensity('Nauru', 541),
      CountryDensity('Korea', 527),
      CountryDensity('Rwanda', 525),
      CountryDensity('Netherlands', 508),
      CountryDensity('Comoros', 467),
      CountryDensity('India', 464),
      CountryDensity('Burundi', 463),
      CountryDensity('Saint-Barthélemy', 449),
      CountryDensity('Haiti', 413),
      CountryDensity('Israel', 400),
      CountryDensity('Tuvalu', 393),
      CountryDensity('Belgium', 382),
      CountryDensity('Curacao', 369),
      CountryDensity('Philippines', 367),
      CountryDensity('Reunion', 358),
      CountryDensity('Martinique', 354),
      CountryDensity('Japan', 346),
      CountryDensity('Sri Lanka', 341),
      CountryDensity('Grenada', 331),
      CountryDensity('Marshall Islands', 328),
      CountryDensity('Puerto Rico', 322),
      CountryDensity('Vietnam', 313),
      CountryDensity('El Salvador', 313),
      CountryDensity('Guam', 312),
      CountryDensity('Saint Lucia', 301),
      CountryDensity('United States Virgin Islands', 298),
      CountryDensity('Pakistan', 286),
      CountryDensity('Saint Vincent and the Grenadines', 284),
      CountryDensity('United Kingdom', 280),
      CountryDensity('American Samoa', 276),
      CountryDensity('Cayman Islands', 273),
      CountryDensity('Jamaica', 273),
      CountryDensity('Trinidad and Tobago', 272),
      CountryDensity('Qatar', 248),
      CountryDensity('Guadeloupe', 245),
      CountryDensity('Luxembourg', 241),
      CountryDensity('Germany', 240),
      CountryDensity('Kuwait', 239),
      CountryDensity('Gambia', 238),
      CountryDensity('Liechtenstein', 238),
      CountryDensity('Uganda', 228),
      CountryDensity('Sao Tome and Principe', 228),
      CountryDensity('Nigeria', 226),
      CountryDensity('Dominican Rep.', 224),
      CountryDensity('Antigua and Barbuda', 222),
      CountryDensity('Switzerland', 219),
      CountryDensity('Dem. Rep. Korea', 214),
      CountryDensity('Seychelles', 213),
      CountryDensity('Italy', 205),
      CountryDensity('Saint Kitts and Nevis', 204),
      CountryDensity('Nepal', 203),
      CountryDensity('Malawi', 202),
      CountryDensity('British Virgin Islands', 201),
      CountryDensity('Guatemala', 167),
      CountryDensity('Anguilla', 166),
      CountryDensity('Andorra', 164),
      CountryDensity('Micronesia', 164),
      CountryDensity('China', 153),
      CountryDensity('Togo', 152),
      CountryDensity('Indonesia', 151),
      CountryDensity('Isle of Man', 149),
      CountryDensity('Kiribati', 147),
      CountryDensity('Tonga', 146),
      CountryDensity('Czech Rep.', 138),
      CountryDensity('Cabo Verde', 138),
      CountryDensity('Thailand', 136),
      CountryDensity('Ghana', 136),
      CountryDensity('Denmark', 136),
      CountryDensity('Tokelau', 135),
      CountryDensity('Cyprus', 130),
      CountryDensity('Northern Mariana Islands', 125),
      CountryDensity('Poland', 123),
      CountryDensity('Moldova', 122),
      CountryDensity('Azerbaijan', 122),
      CountryDensity('France', 119),
      CountryDensity('United Arab Emirates', 118),
      CountryDensity('Ethiopia', 115),
      CountryDensity('Jordan', 114),
      CountryDensity('Slovakia', 113),
      CountryDensity('Portugal', 111),
      CountryDensity('Sierra Leone', 110),
      CountryDensity('Turkey', 109),
      CountryDensity('Austria', 109),
      CountryDensity('Benin', 107),
      CountryDensity('Hungary', 106),
      CountryDensity('Cuba', 106),
      CountryDensity('Albania', 105),
      CountryDensity('Armenia', 104),
      CountryDensity('Slovenia', 103),
      CountryDensity('Egypt', 102),
      CountryDensity('Serbia', 99),
      CountryDensity('Costa Rica', 99),
      CountryDensity('Malaysia', 98),
      CountryDensity('Dominica', 95),
      CountryDensity('Syria', 95),
      CountryDensity('Cambodia', 94),
      CountryDensity('Kenya', 94),
      CountryDensity('Spain', 93),
      CountryDensity('Iraq', 92),
      CountryDensity('Timor-Leste', 88),
      CountryDensity('Honduras', 88),
      CountryDensity('Senegal', 86),
      CountryDensity('Romania', 83),
      CountryDensity('Myanmar', 83),
      CountryDensity('Brunei Darussalam', 83),
      CountryDensity("Côte d'Ivoire", 82),
      CountryDensity('Morocco', 82),
      CountryDensity('Macedonia', 82),
      CountryDensity('Greece', 80),
      CountryDensity('Wallis and Futuna Islands', 80),
      CountryDensity('Bonaire, Sint Eustatius and Saba', 79),
      CountryDensity('Uzbekistan', 78),
      CountryDensity('French Polynesia', 76),
      CountryDensity('Burkina Faso', 76),
      CountryDensity('Tunisia', 76),
      CountryDensity('Ukraine', 75),
      CountryDensity('Croatia', 73),
      CountryDensity('Cook Islands', 73),
      CountryDensity('Ireland', 71),
      CountryDensity('Ecuador', 71),
      CountryDensity('Lesotho', 70),
      CountryDensity('Samoa', 70),
      CountryDensity('Guinea-Bissau', 69),
      CountryDensity('Tajikistan', 68),
      CountryDensity('Eswatini', 67),
      CountryDensity('Tanzania', 67),
      CountryDensity('Mexico', 66),
      CountryDensity('Bosnia and Herz.', 64),
      CountryDensity('Bulgaria', 64),
      CountryDensity('Afghanistan', 59),
      CountryDensity('Panama', 58),
      CountryDensity('Georgia', 57),
      CountryDensity('Yemen', 56),
      CountryDensity('Cameroon', 56),
      CountryDensity('Nicaragua', 55),
      CountryDensity('Guinea', 53),
      CountryDensity('Liberia', 52),
      CountryDensity('Iran', 51),
      CountryDensity('Eq. Guinea', 50),
      CountryDensity('Montserrat', 49),
      CountryDensity('Fiji', 49),
      CountryDensity('South Africa', 48),
      CountryDensity('Madagascar', 47),
      CountryDensity('Montenegro', 46),
      CountryDensity('Belarus', 46),
      CountryDensity('Colombia', 45),
      CountryDensity('Lithuania', 43),
      CountryDensity('Djibouti', 42),
      CountryDensity('Turks and Caicos Islands', 40),
      CountryDensity('Mozambique', 39),
      CountryDensity('Dem. Rep. Congo', 39),
      CountryDensity('Palau', 39),
      CountryDensity('Bahamas', 39),
      CountryDensity('Zimbabwe', 38),
      CountryDensity('United States of America', 36),
      CountryDensity('Eritrea', 35),
      CountryDensity('Faroe Islands', 35),
      CountryDensity('Kyrgyzstan', 34),
      CountryDensity('Venezuela', 32),
      CountryDensity('Lao PDR', 31),
      CountryDensity('Estonia', 31),
      CountryDensity('Latvia', 30),
      CountryDensity('Angola', 26),
      CountryDensity('Peru', 25),
      CountryDensity('Chile', 25),
      CountryDensity('Brazil', 25),
      CountryDensity('Somalia', 25),
      CountryDensity('Vanuatu', 25),
      CountryDensity('Saint Pierre and Miquelon', 25),
      CountryDensity('Sudan', 24),
      CountryDensity('Zambia', 24),
      CountryDensity('Sweden', 24),
      CountryDensity('Solomon Islands', 24),
      CountryDensity('Bhutan', 20),
      CountryDensity('Uruguay', 19),
      CountryDensity('Papua New Guinea', 19),
      CountryDensity('Niger', 19),
      CountryDensity('Algeria', 18),
      CountryDensity('S. Sudan', 18),
      CountryDensity('New Zealand', 18),
      CountryDensity('Finland', 18),
      CountryDensity('Paraguay', 17),
      CountryDensity('Belize', 17),
      CountryDensity('Mali', 16),
      CountryDensity('Argentina', 16),
      CountryDensity('Oman', 16),
      CountryDensity('Saudi Arabia', 16),
      CountryDensity('Congo', 16),
      CountryDensity('New Caledonia', 15),
      CountryDensity('Saint Helena', 15),
      CountryDensity('Norway', 14),
      CountryDensity('Chad', 13),
      CountryDensity('Turkmenistan', 12),
      CountryDensity('Bolivia', 10),
      CountryDensity('Russia', 8),
      CountryDensity('Gabon', 8),
      CountryDensity('Central African Rep.', 7),
      CountryDensity('Kazakhstan', 6),
      CountryDensity('Niue', 6),
      CountryDensity('Mauritania', 4),
      CountryDensity('Canada', 4),
      CountryDensity('Botswana', 4),
      CountryDensity('Guyana', 3),
      CountryDensity('Libya', 3),
      CountryDensity('Suriname', 3),
      CountryDensity('French Guiana', 3),
      CountryDensity('Iceland', 3),
      CountryDensity('Australia', 3),
      CountryDensity('Namibia', 3),
      CountryDensity('W. Sahara', 2),
      CountryDensity('Mongolia', 2),
      CountryDensity('Falkland Is.', 0.2),
      CountryDensity('Greenland', 0.1),
    ];

    mapSource = MapShapeSource.asset(
      'assets/world_map.json',
      shapeDataField: 'name',
      dataCount: worldPopulationDensity.length,
      primaryValueMapper: (int index) =>
      worldPopulationDensity[index].countryName,
      shapeColorValueMapper: (int index) =>
      worldPopulationDensity[index].density,
      shapeColorMappers: <MapColorMapper>[
        const MapColorMapper(
          from: 0,
          to: 100,
          color: Colors.grey,
          text: '{0},{100}',
        ),
        const MapColorMapper(
          from: 100,
          to: 500,
          color: Colors.grey,
          text: '500',
        ),
        const MapColorMapper(
          from: 500,
          to: 1000,
          color: Colors.grey,
          text: '1k',
        ),
        const MapColorMapper(
          from: 1000,
          to: 5000,
          color: Colors.grey,
          text: '5k',
        ),
        const MapColorMapper(
          from: 5000,
          to: 50000,
          color: Colors.grey,
          text: '50k',
        ),
      ],
    );
  }




  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        emit(SelectDateSuccess());
    }
  }
}
