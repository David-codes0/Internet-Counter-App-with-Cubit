


part of 'counter_cubit.dart';


class CounterState extends Equatable {
 final int counterValue;
 final bool? wasIncremented;
  const CounterState({
    required this.counterValue,
    
     this.wasIncremented,
  });
  

  @override
  String toString() {
 
    return 'CounterValue: $counterValue , Incremented ? : $wasIncremented ' ;
  }
  @override

  List<Object?> get props => [counterValue, wasIncremented
      ];



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    //  devtools.log('$map inside here');
    return CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented: map['wasIncremented'] != null ? map['wasIncremented'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) {
   
    return CounterState.fromMap(json.decode(source) as Map<String, dynamic>);
  }
  // with the json file from the app storage.
  // 1. it will first decode it into a map variable and then create a CounterState instance of it
  
 }


