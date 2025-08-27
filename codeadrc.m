figure(1)
set(gcf, 'Renderer', 'painters', 'Position', [10 10 1000 600])
subplot(2,1,2) %Multiple graph on single graph
plot(p2(:,1),p2(:,2),'LineWidth',2)
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 20)
% ylabel('$\Delta \omega_{e,1}$ (HZ)','interpreter','latex','fontsize',20)
ylabel('Control Signal','interpreter','latex','fontsize',20)
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 6])
hold on
grid on
