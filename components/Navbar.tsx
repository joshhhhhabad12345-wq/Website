import React, { useState, useEffect } from 'react';
import { ViewState } from '../types';
import { Swords, Menu, X } from 'lucide-react';

interface NavbarProps {
  currentView: ViewState;
  onNavigate: (view: ViewState) => void;
}

export const Navbar: React.FC<NavbarProps> = ({ currentView, onNavigate }) => {
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  // Lock body scroll when menu is open
  useEffect(() => {
    if (isMobileMenuOpen) {
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = 'unset';
    }
    return () => {
      document.body.style.overflow = 'unset';
    };
  }, [isMobileMenuOpen]);

  const handleNavigate = (view: ViewState) => {
    onNavigate(view);
    setIsMobileMenuOpen(false);
  };

  return (
    <>
      <nav className="fixed top-0 left-0 right-0 z-50 px-6 py-4 flex justify-between items-center backdrop-blur-md bg-black/20 border-b border-white/5">
        <div 
          className="flex items-center gap-2 cursor-pointer group relative z-50" 
          onClick={() => handleNavigate('home')}
        >
          <Swords className="w-8 h-8 text-blood-500 transition-transform group-hover:rotate-12" />
          <span className="font-bold text-xl tracking-wider font-sans">PROJECT <span className="text-blood-500">X</span></span>
        </div>

        {/* Desktop Menu */}
        <div className="hidden md:flex gap-8">
          <NavItem active={currentView === 'home'} onClick={() => onNavigate('home')}>Features</NavItem>
          <NavItem active={currentView === 'script'} onClick={() => onNavigate('script')}>Script</NavItem>
          <NavItem active={currentView === 'community'} onClick={() => onNavigate('community')}>Community</NavItem>
        </div>

        {/* Mobile Menu Toggle (Visible only when menu is closed) */}
        {!isMobileMenuOpen && (
          <button 
            className="md:hidden text-white relative z-50 p-2 hover:bg-white/10 rounded-full transition-all duration-300"
            onClick={() => setIsMobileMenuOpen(true)}
            aria-label="Open menu"
          >
            <Menu className="w-6 h-6" />
          </button>
        )}
      </nav>

      {/* Full Screen Mobile Menu Overlay */}
      <div className={`
        fixed inset-0 z-[60] bg-black flex flex-col
        transition-all duration-500 md:hidden overflow-hidden
        ${isMobileMenuOpen ? 'opacity-100 visible translate-y-0' : 'opacity-0 invisible -translate-y-full pointer-events-none'}
      `}>
        {/* Background Patterns */}
        <div 
          className="absolute inset-0 opacity-30 pointer-events-none" 
          style={{
            backgroundImage: `linear-gradient(rgba(255, 0, 0, 0.15) 2px, transparent 2px), linear-gradient(90deg, rgba(255, 0, 0, 0.15) 2px, transparent 2px)`,
            backgroundSize: '40px 40px',
            maskImage: 'linear-gradient(to bottom, black, transparent 90%)'
          }}
        />
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_30%,rgba(153,0,0,0.2),transparent_70%)] pointer-events-none" />

        {/* Header inside Menu */}
        <div className="px-6 py-4 flex justify-between items-center border-b border-white/10 bg-black/50 backdrop-blur-md relative z-20">
          <div className="flex items-center gap-2">
            <Swords className="w-8 h-8 text-blood-500" />
            <span className="font-bold text-xl tracking-wider font-sans">PROJECT <span className="text-blood-500">X</span></span>
          </div>
          <button 
            className="text-white p-2 hover:bg-white/10 rounded-full transition-colors border border-white/10"
            onClick={() => setIsMobileMenuOpen(false)}
            aria-label="Close menu"
          >
            <X className="w-6 h-6 text-blood-500" />
          </button>
        </div>
        
        {/* Nav Items Container */}
        <div className="flex-1 flex flex-col items-center justify-center gap-6 relative z-10 px-6">
          <MobileNavItem 
            index={0} 
            isOpen={isMobileMenuOpen} 
            active={currentView === 'home'} 
            onClick={() => handleNavigate('home')}
          >
            Features
          </MobileNavItem>
          
          <MobileNavItem 
            index={1} 
            isOpen={isMobileMenuOpen} 
            active={currentView === 'script'} 
            onClick={() => handleNavigate('script')}
          >
            Script
          </MobileNavItem>
          
          <MobileNavItem 
            index={2} 
            isOpen={isMobileMenuOpen} 
            active={currentView === 'community'} 
            onClick={() => handleNavigate('community')}
          >
            Community
          </MobileNavItem>
        </div>

        {/* Decorative footer */}
        <div className="pb-12 flex justify-center opacity-50 relative z-10">
           <div className="h-1 w-24 bg-gradient-to-r from-transparent via-blood-900 to-transparent" />
        </div>
      </div>
    </>
  );
};

const NavItem: React.FC<{ active: boolean; onClick: () => void; children: React.ReactNode }> = ({ active, onClick, children }) => (
  <button 
    onClick={onClick}
    className={`
      text-sm font-bold uppercase tracking-widest transition-all duration-300 relative
      ${active ? 'text-blood-500' : 'text-gray-400 hover:text-white'}
    `}
  >
    {children}
    <span className={`
      absolute -bottom-2 left-0 h-0.5 bg-blood-500 transition-all duration-300
      ${active ? 'w-full shadow-[0_0_10px_#ff0000]' : 'w-0'}
    `} />
  </button>
);

const MobileNavItem: React.FC<{ 
  index: number; 
  isOpen: boolean; 
  active: boolean; 
  onClick: () => void; 
  children: React.ReactNode 
}> = ({ index, isOpen, active, onClick, children }) => (
  <button 
    onClick={onClick}
    style={{ transitionDelay: `${isOpen ? index * 100 : 0}ms` }}
    className={`
      w-full max-w-xs py-4 px-6 rounded-sm
      text-2xl font-bold uppercase tracking-widest transition-all duration-500 transform
      flex items-center justify-between group
      ${isOpen ? 'translate-y-0 opacity-100' : 'translate-y-12 opacity-0'}
      ${active 
        ? 'bg-blood-900/40 text-white border border-blood-500 shadow-[0_0_15px_rgba(255,0,0,0.2)]' 
        : 'bg-zinc-900/50 text-gray-400 border border-zinc-800 hover:bg-zinc-800 hover:text-white hover:border-zinc-700'}
    `}
  >
    <span>{children}</span>
    <span className={`
      w-2 h-2 rounded-full transition-all duration-300
      ${active ? 'bg-blood-500 shadow-[0_0_10px_#ff0000]' : 'bg-zinc-700 group-hover:bg-white'}
    `} />
  </button>
);