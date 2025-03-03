export const add: (a: number, b: number) => number;

// Native侧暴露给ArkTS侧接口的声明。
export const nativeCallArkTS: (a: object) => string;