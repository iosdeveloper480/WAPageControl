Pod::Spec.new do |s|
  s.name             = 'WAPageControl'
  s.version          = '1.0'
  s.summary          = 'WAPageControl is a set of cool animated page controls written in Swift to replace boring UIPageControl.'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.homepage         = 'https://github.com/WAliLabs/WAPageControl'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Waqas Ali' => 'waqasaliw@gmail.com' }
  s.source           = { :git => 'https://github.com/iosdeveloper480/WAPageControl.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'

  s.source_files = 'WAPageControl/*.swift', 'WAPageControl/Core/*.swift'

  s.subspec 'Aji' do |aji|
    aji.source_files = 'WAPageControl/WAPageControlAji.swift', 'WAPageControl/Core/*.swift'
  end

  s.subspec 'Aleppo' do |aleppo|
    aleppo.source_files = 'WAPageControl/WAPageControlAleppo.swift', 'WAPageControl/Core/*.swift'
  end

  s.subspec 'Vickey' do |vickey|
    vickey.source_files = 'WAPageControl/WAPageControlVickey.swift', 'WAPageControl/Core/*.swift'
  end

  s.subspec 'Fresno' do |fresno|
    fresno.source_files = 'WAPageControl/WAPageControlFresno.swift', 'WAPageControl/Core/*.swift'
  end

  s.subspec 'Jalapeno' do |jalapeno|
    jalapeno.source_files = 'WAPageControl/WAPageControlJalapeno.swift', 'WAPageControl/Core/*.swift'
  end

  s.subspec 'Jaloro' do |jaloro|
    jaloro.source_files = 'WAPageControl/WAPageControlJaloro.swift', 'WAPageControl/Core/*.swift'
  end

  s.subspec 'Paprika' do |paprika|
    paprika.source_files = 'WAPageControl/WAPageControlPaprika.swift', 'WAPageControl/Core/*.swift'
  end

  s.subspec 'Puya' do |puya|
    puya.source_files = 'WAPageControl/WAPageControlPuya.swift', 'WAPageControl/Core/*.swift'
  end

end
