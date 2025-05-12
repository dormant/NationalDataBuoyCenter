clear;

setup = setupGlobals();
fetchWeatherNDBCrt( setup );

days1 = 5;
days2 = 1;
switch setup.Hostname
    case 'opsproc3'
        nowUTC = now;
    otherwise
        nowUTC = now -2/24;
end
tLimits1 = [ ceil(nowUTC)-days1 ceil(nowUTC) ];
tLimits2 = [ nowUTC-days2 nowUTC ];

fetchWeatherNDBCrt( setup );
data_file = fullfile( setup.DirMegaplotData, 'fetchedWeatherNDBCrt.mat' );
load( data_file );

for ibuoy = 1:3
    switch ibuoy
        case 1
            datim = datimB42060;
            waveDir = waveDirB42060;
            waveHeight = waveHeightB42060;
            windSpeed = windSpeedB42060;
            windDir = windDirB42060;
            buoy = '42060';
            tit1 = sprintf( 'Buoy 42060 (63 NM WSW of Montserrat), last %d days', days1 );
            tit2 = sprintf( 'Buoy 42060 (63 NM WSW of Montserrat), last %d days', days2 );
        case 2
            datim = datimB41040;
            waveDir = waveDirB41040;
            waveHeight = waveHeightB41040;
            windSpeed = windSpeedB41040;
            windDir = windDirB41040;
            buoy = '41040';
            tit1 = sprintf( 'Buoy 41040 (470 NM East of Martinique), last %d days', days1 );
            tit2 = sprintf( 'Buoy 41040 (470 NM East of Martinique), last %d days', days2 );
        case 3
            datim = datimB41044;
            waveDir = waveDirB41044;
            waveHeight = waveHeightB41044;
            windSpeed = windSpeedB41044;
            windDir = windDirB41044;
            buoy = '41044';
            tit1 = sprintf( 'Buoy 41044 (330 NM NE St Martin Is), last %d days', days1 );
            tit2 = sprintf( 'Buoy 41044 (330 NM NE St Martin Is), last %d days', days2 );
    end

    waveDir( waveDir > 270 ) = ...
        waveDir( waveDir > 270 ) - 360;

    windDir( windDir > 270 ) = ...
        windDir( windDir > 270 ) - 360;

    figure;
    figure_size( 'l' );
    tiledlayout(4,1);

    ax1 = nexttile;
    plot( datim, waveDir, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r' );
    xlim( tLimits1 );
    ylim( [-90 270] );
    datetick( 'x', 'keeplimits' );
    yticks( [-90 0 90 180 270] );
    grid on;
    grid minor;
    title( 'Wave direction (degrees from N)' );

    ax2 = nexttile;
    plot( datim, waveHeight, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r' );
    xlim( tLimits1 );
    yl = ylim;
    ylim( [0 yl(2)] );
    datetick( 'x', 'keeplimits' );
    grid on;
    grid minor;
    title( 'Wave height (metres)' );

    ax3 = nexttile;
    plot( datim, windDir, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r' );
    xlim( tLimits1 );
    ylim( [-90 270] );
    yticks( [-90 0 90 180 270] );
    datetick( 'x', 'keeplimits' );
    grid on;
    grid minor;
    title( 'Wind direction (degrees from N)' );

    ax4 = nexttile;
    plot( datim, windSpeed, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r' );
    xlim( tLimits1 );
    yl = ylim;
    ylim( [0 1.1*yl(2)] );
    datetick( 'x', 'keeplimits' );
    grid on;
    grid minor;
    title( 'Wind speed (metres/second)' );
    xlabel( 'Time (UTC)' );

    linkaxes([ax1 ax2 ax3 ax4],'x')

    plotOverTitle( tit1 );
    fileSave = sprintf( 'NDBC_%s-last_%d_days.png', buoy, days1 );
    fileSave = fullfile( '/mnt/mvofls2/Seismic_Data/monitoring_data/weather_plots', fileSave );
    saveas( gcf, fileSave );

    xlim( tLimits2 );
    plotOverTitle( tit2 );
    fileSave = sprintf( 'NDBC_%s-last_%d_days.png', buoy, days2 );
    fileSave = fullfile( '/mnt/mvofls2/Seismic_Data/monitoring_data/weather_plots', fileSave );
    saveas( gcf, fileSave );

    
    close;

end
