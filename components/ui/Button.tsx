import React from 'react';
import { LucideIcon } from 'lucide-react';

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'outline';
  icon?: LucideIcon;
  glowing?: boolean;
}

export const Button: React.FC<ButtonProps> = ({ 
  children, 
  variant = 'primary', 
  icon: Icon, 
  className = '', 
  glowing = false,
  ...props 
}) => {
  const baseStyles = "px-6 py-3 rounded-sm font-bold uppercase tracking-wider transition-all duration-300 flex items-center justify-center gap-2 group relative overflow-hidden";
  
  const variants = {
    primary: "bg-blood-600 hover:bg-blood-500 text-white border border-blood-500",
    secondary: "bg-black hover:bg-zinc-900 text-white border border-zinc-800",
    outline: "bg-transparent border border-blood-600 text-blood-500 hover:bg-blood-900/20 hover:text-red-400"
  };

  const glowStyle = glowing ? "shadow-[0_0_15px_rgba(255,0,0,0.5)] hover:shadow-[0_0_25px_rgba(255,0,0,0.8)]" : "";

  return (
    <button 
      className={`${baseStyles} ${variants[variant]} ${glowStyle} ${className}`}
      {...props}
    >
      <span className="relative z-10 flex items-center gap-2">
        {Icon && <Icon className="w-5 h-5 transition-transform group-hover:scale-110" />}
        {children}
      </span>
      {variant === 'primary' && (
        <div className="absolute inset-0 -translate-x-full group-hover:translate-x-0 bg-gradient-to-r from-transparent via-white/20 to-transparent transition-transform duration-500 ease-in-out skew-x-12" />
      )}
    </button>
  );
};