import bridge from '@arkui-x.bridge'

@Entry
@Component
struct Index {
  @State bridgeImpl: BridgeObject = bridge.createBridge("BridgeName");

  private funTest(p1: String, p2: Number, p3: Boolean) {
    console.info('Java->Ts bridge funTest p1 is ' + p1);
    console.info('Java->Ts bridge funTest p2 is ' + p2);
    console.info('Java->Ts bridge funTest p3 is ' + p3);
  }

  private funTestArray(p1: Array<string>, p2: Array<Number>, p3: Array<Boolean>) {
    console.log('Java->Ts bridge funTestArray p1 is ' + p1.toString());
    console.log('Java->Ts bridge funTestArray p2 is ' + p2.toString());
    console.log('Java->Ts bridge funTestArray p3 is ' + p3.toString());
  }

  private funTestRecord(p1: Record<string, string>, p2: Record<string, Number>, p3: Record<string, Boolean>) {
    console.log('Java->Ts bridge funTestRecord p1 is ' + p1.toString());
    console.log('Java->Ts bridge funTestRecord p2 is ' + p2.toString());
    console.log('Java->Ts bridge funTestRecord p3 is ' + p3.toString());
  }

  onPageShow() {
    // Register JavaScript functions
    this.bridgeImpl.registerMethod({name: "funTest", method: this.funTest});
    this.bridgeImpl.registerMethod({name: "funTestArray", method: this.funTestArray});
    this.bridgeImpl.registerMethod({name: "funTestRecord", method: this.funTestRecord});
  }

  build() {
    Row() {
      Column() {

      }
      .width('100%')
    }
    .height('100%')
  }
}